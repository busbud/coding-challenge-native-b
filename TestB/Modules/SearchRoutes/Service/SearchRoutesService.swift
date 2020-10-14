
import Foundation
import Alamofire

typealias XDeparturesResult = Result<XDepartures, NetworkError>

protocol SearchRoutesService: NetworkService {
  func getDepartures(origin: GeoHash,
                     destination: GeoHash,
                     outboundDate: Date,
                     numberOfAdults: Int,
                     completion: @escaping (XDeparturesResult) -> Void)
  func getMoreDepartures(origin: GeoHash,
                         destination: GeoHash,
                         outboundDate: Date,
                         numberOfAdults: Int,
                         index: Int,
                         completion: @escaping (XDeparturesResult) -> Void)
}

final class SearchRoutesDefaultService: SearchRoutesService {

  let requestURL: RequestURL
  let path: RequestEndpoint
  let method: RequestMethod


  init(requestURL: RequestURL = .main,
       path: RequestEndpoint = .x_departures,
       method: RequestMethod = .get) {
    self.requestURL = requestURL
    self.path = path
    self.method = method
  }

  func getDepartures(origin: GeoHash,
                     destination: GeoHash,
                     outboundDate: Date,
                     numberOfAdults: Int,
                     completion: @escaping (XDeparturesResult) -> Void) {

    let queryParameters: Parameters = ["adult": numberOfAdults]
    let paths = [path.rawValue,origin, destination,outboundDate.iso8061]
    makeRequest(queryParameters: queryParameters, paths: paths, completion: completion)
  }

  func getMoreDepartures(origin: GeoHash,
                         destination: GeoHash,
                         outboundDate: Date,
                         numberOfAdults: Int,
                         index: Int,
                         completion: @escaping (XDeparturesResult) -> Void) {

    let queryParameters: Parameters = ["adult": numberOfAdults,
                                       "index": String(index)]
    let paths = [path.rawValue,origin, destination,outboundDate.iso8061, RequestEndpoint.poll.rawValue]
    makeRequest(queryParameters: queryParameters, paths: paths, completion: completion)
  }

  private func makeRequest(queryParameters: Parameters,
                             paths: [String],
                             completion: @escaping (XDeparturesResult) -> Void) {

    alamofireSession.request(URLConvertible(url: requestURL.url,
                                            paths: paths),
                             method: method.HTTPMethod,
                             parameters: queryParameters).response { [weak self] response in
                              switch response.result {
                              case .success(let data):
                                if let data = data, let xDepartures = self?.parseResponse(data: data) {
                                  completion(.success(xDepartures))
                                } else {
                                  completion(.failure(.parsingFailed))
                                }
                              case .failure(let error):
                                completion(.failure(.unKnown))
                              }
    }
  }

  private func parseResponse(data: Data) -> XDepartures? {
    do {
      let xDepartures = try JSONDecoder().decode(XDepartures.self, from: data)
      return xDepartures
    } catch {
      return nil
    }
  }


}
