//
//  TravellerPickerView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI
import BBServices

struct TravellerPickerView: View {
    
    @ObservedObject var viewModel: HomeViewModel

    var ticketsRange: ClosedRange<Double> {
        0...50
    }
    
    var body: some View {
        
        List {
            
            HStack {
                Stepper("Adults", value: $viewModel.adult, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(self.viewModel.adult)))")
            }
            HStack {
                Stepper("Children", value: self.$viewModel.child, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(self.viewModel.child)))")
            }
            HStack {
                Stepper("Senior", value: self.$viewModel.senior, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(self.viewModel.senior)))")
            }
        }
    }
}
