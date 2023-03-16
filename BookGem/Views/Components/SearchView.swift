//
//  SearchView.swift
//  BookGem
//
//  Created by саргашкаева on 9.03.2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var textSearch: String
  
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Write book title", text:  $textSearch)
                
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .onTapGesture {
                        self.textSearch = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
