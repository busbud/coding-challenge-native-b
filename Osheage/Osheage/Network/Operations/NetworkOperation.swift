//
//  NetworkOperation.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

class NetworkOperation: AsyncOperation {
    
    var endpoint: String { return "" }
    var queryItems: [URLQueryItem] { return [] }
    
    private var method: NetworkOperation.Method { return .get }
    private var timeoutInterval = 30.0
    private var task: URLSessionDataTask?
    private var successCodes: CountableRange<Int> = 200..<299
    private var failureCodes: CountableRange<Int> = 400..<499
    
    func prepareURLComponents() -> URLComponents? {
        return URLComponents()
    }
    
    func prepareHeaders() -> [String: String]? {
        return nil
    }
    
    func prepareURLRequest() throws -> URLRequest {
        guard let url = prepareURLComponents()?.url else {
            throw RequestError.invalidURL
        }
        return URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
    }
    
    override func main() {
        
        dispatchPrecondition(condition: .notOnQueue(DispatchQueue.main))
        
        guard var request = try? prepareURLRequest() else {
            finish(with: RequestError.invalidURL)
            return
        }
        
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = method.rawValue
        
        let session = URLSession.shared
        task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            self.processResponse(response, data: data, error: error)
        })
        task?.resume()
    }
    
    override func cancel() {
        task?.cancel()
        super.cancel()
    }
    
    func processResponseData(_ data: Data?) {
        super.completed()
    }
}

private extension NetworkOperation {
    
    func processResponse(_ response: URLResponse?, data: Data?, error: Error?) {
        if let error = error {
            return finish(with: error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            return finish(with: RequestError.noHTTPResponse)
        }
        
        processHTTPResponse(httpResponse, data: data)
    }
    
    func processHTTPResponse(_ response: HTTPURLResponse, data: Data?) {
        let statusCode = response.statusCode
        
        if successCodes.contains(statusCode) {
            processResponseData(data)
        } else if failureCodes.contains(statusCode) {
            if let data = data, let responseBody = try? JSONSerialization.jsonObject(with: data, options: []) {
                debugPrint(responseBody)
            }
            finish(with: RequestError.http(status: statusCode))
        } else {
            let info = [
                NSLocalizedDescriptionKey: "Request failed with code \(statusCode)",
                NSLocalizedFailureReasonErrorKey: "Wrong endpoing mapping or backend bug."
            ]
            let error = NSError(domain: "NetworkOperation", code: 0, userInfo: info)
            finish(with: error)
        }
    }
}

extension NetworkOperation {
    enum Method: String {
        case get, post
    }
    
    enum RequestError: Error {
        case invalidURL
        case noHTTPResponse
        case http(status: Int)
        
        var localizedDescription: String {
            switch self {
            case .invalidURL:
                return "Invalid URL."
            case .noHTTPResponse:
                return "Not a HTTP response."
            case .http(let status):
                return "HTTP error: \(status)."
            }
        }
    }
}
