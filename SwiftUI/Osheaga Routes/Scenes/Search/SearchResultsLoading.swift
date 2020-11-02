//
//  SearchResultsLoading.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct SearchResultsLoading: View {
    var body: some View {
        Spacer()
        Text("Fetching results…")
            .foregroundColor(.gray)
            .font(Font.system(.title2).bold())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
}

struct SearchResultsLoading_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsLoading()
    }
}
