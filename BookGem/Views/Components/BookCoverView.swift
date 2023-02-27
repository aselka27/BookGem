//
//  BookCoverView.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import SwiftUI

struct BookCoverView: View {
    
   @StateObject private var vm = BookCoverViewModel()
    private var isbn: String
    
    init(isbn: String) {
        self.isbn = isbn
    }
   
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 135)
                    .cornerRadius(10)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            vm.fetchCover(isbn: isbn)
        }
    }
}

//struct BookCoverView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookCoverView()
//    }
//}
