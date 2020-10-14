
import Foundation

protocol OnboardInteractor: AnyObject {
  
}

protocol OnboardInteractorOutput: AnyObject {
}


final class DefaultOnboardInteractor {
  weak var output: OnboardInteractorOutput?
  private var index = 0
  typealias MoreDeparturesCall = () -> ()
}

extension DefaultOnboardInteractor: OnboardInteractor {

}

