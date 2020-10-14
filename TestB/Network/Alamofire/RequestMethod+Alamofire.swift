
import Foundation
import Alamofire

extension RequestMethod {

  var HTTPMethod: Alamofire.HTTPMethod {
    switch self {
    case .get:
      return Alamofire.HTTPMethod.get
    }
  }
}
