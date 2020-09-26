//
//  HomeInteractor.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import Combine

final class HomeInteractor: InteractorInterface {

    weak var presenter: HomePresenterInteractorInterface!
}

extension HomeInteractor: HomeInteractorPresenterInterface {

    
}
