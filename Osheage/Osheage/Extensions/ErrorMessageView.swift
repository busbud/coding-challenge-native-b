//
//  ErrorMessageView.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import SwiftMessages

class ErrorMessageView: MessageView {
    static func with(description: String) -> MessageView {
        let view = ErrorMessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureContent(title: nil, body: description,
                              iconImage: nil, iconText: nil,
                              buttonImage: nil, buttonTitle: nil,
                              buttonTapHandler: nil)
        view.button?.removeFromSuperview()
        return view
    }
}
