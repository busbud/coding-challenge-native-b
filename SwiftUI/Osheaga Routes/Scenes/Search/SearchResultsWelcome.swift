//
//  SearchResultsWelcome.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct SearchResultsWelcome: View {
    var body: some View {
        Spacer()
        Text("Hit the search button above and check out the results")
            .foregroundColor(.gray)
            .font(Font.system(.title2).bold())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
}

struct SearchResultsWelcome_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsWelcome()
    }
}
