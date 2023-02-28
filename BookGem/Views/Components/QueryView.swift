//
//  QueryView.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import SwiftUI

struct QueryView: View {
    
    private var book: BestSellerInfo
    
    init(book: BestSellerInfo) {
        self.book = book
    }
   
    var body: some View {
        HStack {
//            if let isbn = book.isbns?[0].isbn13 {
//                BookCoverView(isbn: isbn)
//            }
            Image("gatsby")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 135)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title ?? "N/A")
                    .font(.title2)
                    .fontWeight(.bold)
                
                    
                Text(book.author ?? "N/A")
                    .font(.body)
                    .fontWeight(.semibold)
                   
                Text( "$\(book.price ?? "N/A")")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
            .padding(.vertical)
            Spacer()
    }
    .padding(.leading)
    }
}

//struct QueryView_Previews: PreviewProvider {
//    static var previews: some View {
//        QueryView()
//    }
//}
