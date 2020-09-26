//
//  HomeRouter.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import UIKit

final class HomeRouter: RouterInterface {

    weak var presenter: HomePresenterRouterInterface!
    
    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRouterPresenterInterface {

}
