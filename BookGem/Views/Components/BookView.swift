//
//  BookView.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//

import SwiftUI

struct BookView: View {
    
    private var book: Book
    
    init(book: Book) {
        self.book = book
    }
   
    var body: some View {
        HStack {
            Image("gatsby")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 135)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text(book.bookDetails?[0].title ?? "N/A")
                    .font(.title2)
                    .fontWeight(.bold)
                
                    
                Text(book.bookDetails?[0].author ?? "N/A")
                    .font(.body)
                    .fontWeight(.semibold)
                   
                Text( "$\(book.bookDetails?[0].price ?? "N/A")")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
            .padding(.bottom)
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView(book: Boo)
//    }
//}
