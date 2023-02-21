//
//  BookCategoryView.swift
//  BookGem
//
//  Created by саргашкаева on 21.02.2023.
//

import SwiftUI

struct BookCategoryView: View {
    var bookCategory: BookList
    
    var body: some View {
        VStack {
            VStack {
                Image(bookCategory.name)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .background(Color("categoryBackground"))
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(bookCategory.name)
                            .font(.title3)
                        Text("59 books")
                    }
                    .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            Spacer(minLength: 0)
        }
    }
}


//struct BookCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookCategoryView()
//    }
//}
