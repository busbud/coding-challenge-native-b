//
//  SearchView.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI


struct SearchView: View {
    
    var userWantsToSearch: (() -> Void)?
    var items: [SearchItem] = [SearchItem(id: 0, name: "Quebec", imageNamed: "ic-search-from"),
                               SearchItem(id: 1, name: "Montreal", imageNamed: "ic-search-to"),
                               SearchItem(id: 2, name: "29th of July 2021", imageNamed: "ic-search-calendar")]
    
    var body: some View {
        
            
        VStack(alignment: .leading, content: {
            
            ForEach(items) { item in
                
                SearchField(for: item)
                
            }.listRowInsets(.none)
                
            HStack(content: {
                
                
                NumberOfAdults()
                
                Spacer().frame(width: 10)
                
                NumberOfAdultsStepper(mode: .decrease)
                NumberOfAdultsStepper(mode: .increase)
                
                SearchButton(userWantsToSearch: userWantsToSearch)
                
            })
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity)
            
            
        })
        .padding(.leading, 10)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .background(Color("SecondaryColor"))
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

fileprivate struct NumberOfAdultsStepper: View {
    
    enum Mode {
        case decrease, increase
    }
    
    var mode: Mode
    
    var body: some View {
        Button(action: {}, label: {
            Image(mode == .decrease ? "ic-search-minus" : "ic-search-plus")
        })
        .disabled(true)
        .frame(width: 40, height: 40, alignment: .center)
        .background(Color("PrimaryColor"))
        .cornerRadius(4)
    }
}

fileprivate struct NumberOfAdults: View {
    var body: some View {
        
        Group {
            
            Image("ic-search-people")
            
            ZStack(content: {
                Text("1 Adult")
                    .cornerRadius(4)
                    .frame(minHeight: 40)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .font(Font.system(size: 14).italic())
                
            })
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            
        }
    }
}

fileprivate struct SearchButton: View {

    var userWantsToSearch: (() -> Void)?
    var body: some View {
        Button(action: {
            self.userWantsToSearch?()
        }, label: {
            Text("SEARCH")
                .frame(height: 40, alignment: .center)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        })
        .background(Color("PrimaryColor"))
        .cornerRadius(4)
    }
}

fileprivate struct SearchField: View {
    
    var item: SearchItem
    
    init(for item: SearchItem) {
        self.item = item
    }
    
    var body: some View {
        
        HStack(content: {
            
            Image(item.imageNamed)
            
            TextField(item.name, text: Binding.constant(item.name))
                .textFieldStyle(MainTextFieldStyle())
            
        }).padding(.trailing, 20)
        
    }
}
