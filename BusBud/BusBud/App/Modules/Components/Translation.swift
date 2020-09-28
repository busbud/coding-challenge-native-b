//
//  Translation.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

//TODO: Need to look into common method
enum Translation {
    
    
    static var busbud: String {
        
        return NSLocalizedString("Busbud", tableName: "Home", bundle: Bundle.main, comment: "")
    }
    
    static var email: String {
        
        return NSLocalizedString("email", tableName: "Home", bundle: Bundle.main, comment: "")
    }
    
    static var register: String {
        
        return NSLocalizedString("Sign me up", tableName: "Home", bundle: Bundle.main, comment: "")
    }

    static var registerTitle: String {
        
        return NSLocalizedString("Want better prices?", tableName: "Home", bundle: Bundle.main, comment: "")
    }
    
    static var registerSubTitle: String {
        
        return NSLocalizedString("Sign up and receive exclusive coupons and discounts on all bus trips. ", tableName: "Home", bundle: Bundle.main, comment: "")
    }

}

struct Translation_Previews: PreviewProvider {
    static var previews: some View {
        Text(Translation.busbud)
    }
}
