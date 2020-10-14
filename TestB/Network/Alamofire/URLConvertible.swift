
import Foundation
import Alamofire

struct URLConvertible: Alamofire.URLConvertible {

  private var url: URL
  init(url: URL, paths: [String]) {
    self.url = url
    for path in paths {
      if let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
        self.url.appendPathComponent(encodedPath, isDirectory: false)
      }
    }
  }
  
  func asURL() throws -> URL {
    return url
  }
}
