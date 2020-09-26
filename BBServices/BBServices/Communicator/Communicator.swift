//
//  Communicator.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

internal let kRequestTimeout:Double = 60

internal extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString
    }
}

/**
 * This class was designed and implemented for communicate with server.
 */
internal class Communicator: NSObject {

    /**
     * Singleton object of Communicator class.
     */
    internal static let shared = Communicator()
    
    /**
     * Property hold the value of queue.
     */
    private let queue:OperationQueue = OperationQueue()
    
    /**
     * Init method for communicator, unavaiable for other class.
     */
    private override init() {
        
        queue.maxConcurrentOperationCount = 5
    }
    
    /**
     * @discussion This method accept request then callback after response or error gets.
     *
     * @param request object will hold the value of Request object.
     *
     * @param callback The callback will return Response object or VError object.
     */
    internal func execute(request:Request!, callback: @escaping ((_ response:Response?, _ error:CommError?) -> Void)) {
      
        if request.isMockData {
            
            callback(request.mockResponse, request.mockError)
        } else {
            
            var logs:String = ""
            let session = self.defaultSession()
            let urlRequest = self.getRequest(request: request)
            let date = Date()
            
            if ServiceContext.context.configuration.isLoggigEnable {

                logs = logs + "=================================================\n\n"
                logs = logs + "URL         :\n\(urlRequest.url!)\n\n"
                logs = logs + "HTTP Method :\n\(request.requestMethodType.rawValue)\n\n"

                if let headers = request.requestHeaders {
                    
                    do {
                        let data = try JSONSerialization.data(withJSONObject: headers, options: JSONSerialization.WritingOptions.prettyPrinted)
                        logs = logs + "HTTP Headers:\n\(String(bytes: data, encoding: String.Encoding.utf8)!)\n\n"
                    } catch {
                        print("json error: \(error.localizedDescription)")
                    }
                    
                }
                if let body = request.requestBody {
                    if body.count < 3000 {
                        logs = logs + "Request     :\n\(body.prettyPrintedJSONString ?? "")\n\n"
                    }
                }
            }
            
            let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
                if ServiceContext.context.configuration.isLoggigEnable {

                    if let d = data {
                        logs = logs + "Response    :\n\(d.prettyPrintedJSONString ?? "")\n\n"
                    }
                    logs = logs + "Service Time:\n\(Date().timeIntervalSince(date)) sec\n\n"
                    logs = logs + "=================================================\n"
                    print(logs)
                }
                
                if let err = error {

                    print(err.localizedDescription)
                    let responseObject = self.getResponse(data: data, response: response)
                    let errorObject = self.getError(error: err)
                    callback(responseObject, errorObject)

                } else {

                    let responseObject = self.getResponse(data: data, response: response)
                    callback(responseObject, nil)
                }
            })
            task.resume()
        }
    }
    
    internal func addLog(_ log:String, _ fileName:String) {
        
        var docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        docDirectory.appendPathComponent("log")
        let logpathe = docDirectory.appendingPathComponent(fileName)
        do {
            try FileManager.default.createDirectory(at: docDirectory, withIntermediateDirectories: true, attributes: nil)
        }catch {
            print(error.localizedDescription)
        }
        
        do {
            let handle = try FileHandle(forWritingTo: logpathe)
            handle.seekToEndOfFile()
            handle.write(log.data(using: .utf8)!)
            handle.closeFile()
        } catch {
            print(error.localizedDescription)
            do {
                try log.data(using: .utf8)?.write(to: logpathe)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    internal func printLog(_ fileName:String) {
        
        var docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        docDirectory.appendPathComponent("log")
        let logpathe = docDirectory.appendingPathComponent(fileName)
        do {
            let text2 = try String(contentsOf: logpathe, encoding: .utf8)
            try FileManager.default.removeItem(at: logpathe)
            print(text2)
        } catch {
            
        }
    }
    
    /**
     * @discussion cancelAllRequests will remove all your current request.
     */
    internal func cancelAllRequests() {
        
        self.defaultSession().getTasksWithCompletionHandler { (dataTasks, uploadTasks, downloadTasks) in
            
            if (dataTasks.count == 0) {
                return
            }
            _ = dataTasks.map { $0.cancel() }
        }
    }
    
    /**
     * @discussion This method will cancel your task.
     *
     * @param taskId object will hold the value of Int object.
     */
    internal func cancel(task taskId:Int!) {
        
        self.defaultSession().getTasksWithCompletionHandler { (dataTasks, uploadTasks, downloadTasks) in
            
            if (dataTasks.count == 0) {
                return
            }
            
            let tasks = dataTasks.filter{ $0.taskIdentifier == taskId }
            _ = tasks.map { $0.cancel() }
        }
    }
    
    /**
     * @discussion This method return default URLSession configuration.
     *
     * @return Object will hold the value of URLSession object.
     */
    private func defaultSession() -> URLSession {
     
        let configuration:URLSessionConfiguration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.timeoutIntervalForRequest = kRequestTimeout
        let session:URLSession = URLSession(configuration: configuration)

        return session
    }
    
    /**
     * @discussion This method convert Request type class to URLRequest.
     *
     * @return Object will hold the value of URLRequest object.
     */
    private func getRequest(request:Request!) -> URLRequest {
        
        let path = request?.path ?? "";
        let url:URL = URL(string: request.url + path)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        var items:[URLQueryItem] = []
    
        if let queriesParams = request.queriesParams {
            
            for (key, value) in queriesParams {
                
                let item = URLQueryItem(name: key, value: value as? String)
                items.append(item)
            }
        }
        
        components?.queryItems = items
        
        var urlRequest:URLRequest = URLRequest(url: components?.url ?? url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: kRequestTimeout)
        
        if request!.requestMethodType != RequestMethodType.get {
         
            if let data = request.requestBody {
                
                let stringData:String = String(bytes: data, encoding: String.Encoding.utf8)!
                urlRequest.httpBody = stringData.data(using: String.Encoding.utf8, allowLossyConversion: true)
            }
        }
        
        if let requestHeaders = request.requestHeaders {
            
            for (key, value) in requestHeaders {
                
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        urlRequest.httpMethod = request.requestMethodType.map { $0.rawValue }
        
        return urlRequest
    }

    /**
     * @discussion This method accepts Data, URLResponse and return Response type of object.
     *
     * @return Object will hold the value of Response object.
     */
    private func getResponse(data:Data?, response:URLResponse?) -> Response {

        let responseObject:Response = Response()
        responseObject.response = response as? HTTPURLResponse
        responseObject.responseBody = data
        return responseObject
    }
    
    /**
     * @discussion This method accepts Error and return CommError type of object.
     *
     * @return Object will hold the value of CommError object.
     */
    private func getError(error:Error) -> CommError {
        
        let errorObject = CommError()
        errorObject.errorCode = 10005
        errorObject.errorMessage = error.localizedDescription
        
        return errorObject
    }
}
