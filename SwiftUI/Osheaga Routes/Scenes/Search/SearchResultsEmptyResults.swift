//
//  SearchResultsEmptyResults.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct SearchResultsEmptyResults: View {
    var body: some View {
        
        Spacer()
        
        // Honestly this is a screen that should never appear
        // But we should consider every possibility even the
        // ones that may never happen... until they do. Let's
        // leave a nice and lovely message for our dearest
        // customer.
        
        Text("No availale routes. If you believe this an error, please get in touch with us. :)")
            .foregroundColor(.gray)
            .font(Font.system(.title2).bold())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
}

struct SearchResultsEmptyResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsEmptyResults()
    }
}
