//
//  CategoryView.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//

import SwiftUI

struct CategoryView: View {
//   var category: BookList
    @StateObject var vm: CategoryViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Young Adult")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top)
                        
                    Spacer(minLength: 30)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 1), spacing: 20) {
                        ForEach(vm.books, id: \.amazonProductURL ) { book in
                            BookView(book: book)
                        }
                    }
                }
            }
        } .onAppear {
            self.vm.getBook(category: BookList.YoungAdult.encodedName)
        }
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(vm: CategoryViewModel())
//    }
//}
