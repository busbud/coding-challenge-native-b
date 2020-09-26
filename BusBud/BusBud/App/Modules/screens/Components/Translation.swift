//
//  Translation.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

enum Translation {
    
    
    static var HomeTitle: String {
        
        return NSLocalizedString("HomeTitle", tableName: "Home", bundle: Bundle.main, comment: "")
    }
}

struct Translation_Previews: PreviewProvider {
    static var previews: some View {
        Text(Translation.HomeTitle)
    }
}
