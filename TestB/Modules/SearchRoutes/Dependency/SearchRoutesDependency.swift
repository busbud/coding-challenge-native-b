

import Foundation

protocol SearchRoutesDependency {
  var service: SearchRoutesService { get }
}

final class SearchRoutesDefaultDependency: SearchRoutesDependency {
  let service: SearchRoutesService = SearchRoutesDefaultService()
}
