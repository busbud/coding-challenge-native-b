//
//  PresenterFactory.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

struct PresenterFactory {
    static func presenter(for view: View.Type) -> Presenter {
        switch view {
        case is SearchViewController.Type:
            return SearchPresenter()
        default:
            fatalError("Architecture flaw: View not found in PresenterFactory")
        }
    }
}
