
import Foundation

typealias GeoHash = String

enum RequestMethod: String {
  case get
}

enum RequestURL {
  case main

  var url: URL {
    switch self {
    case .main:
      return URL(string: "https://napi.busbud.com")! // exception for force unwrap as we know URL will be created.
    }
  }
}

enum RequestEndpoint: String {
  case x_departures = "/x-departures"
  case poll = "/poll"
}

enum NetworkError: Error {
  case noInternet
  case unKnown
  case parsingFailed
}

protocol NetworkService {
  var requestURL: RequestURL { get }
  var path: RequestEndpoint { get }
  var method: RequestMethod { get }
}
