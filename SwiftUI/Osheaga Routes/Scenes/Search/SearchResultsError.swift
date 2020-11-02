//
//  SearchResultsError.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct SearchResultsError: View {
    
    var userWantsToTryAgain: (() -> Void)?
    
    var body: some View {
        
        Spacer()
        
        // What if the user faces a server error or simply
        // isn't connected to the internet? Let them know.
        
        Text("We couldn’t retrieve the results, check your internet or try again later")
            .foregroundColor(.gray)
            .font(Font.system(.title2).bold())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
        
        Button.init("TRY AGAIN") {
            self.userWantsToTryAgain?()
        }
        .padding(.top, 10)
        .foregroundColor(.blue)
        .font(Font.system(.title2).bold())
        
    }
}

struct SearchResultsError_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsError(userWantsToTryAgain: nil)
    }
}
