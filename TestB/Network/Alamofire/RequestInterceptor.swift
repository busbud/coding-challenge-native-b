
import Foundation
import Alamofire

final class RequestInterceptor: Alamofire.RequestInterceptor {

  let accessToken: String = "PARTNER_BaASYYHxTxuOINEOMWq5GA"
  
  func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
      var urlRequest = urlRequest
      urlRequest.headers.add(HTTPHeader(name: "X-Busbud-Token", value: accessToken))
      urlRequest.headers.add(.accept("application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"))
      completion(.success(urlRequest))
  }
}
