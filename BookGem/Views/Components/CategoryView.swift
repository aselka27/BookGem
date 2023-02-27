//
//  CategoryView.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//

import SwiftUI

struct CategoryView: View {
    var category: BookList
    @StateObject var vm = CategoryViewModel()
    
    init(category: BookList) {
        self.category = category
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(category.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top)
                        
                    Spacer(minLength: 30)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 1), spacing: 20) {
                        
                        ForEach(vm.books, id: \.amazonProductURL ) { book in
                            NavigationLink {
                                if let bookDetailModel = book.bookDetails?[0] {
                                    BookDetailView(bookDetailModel: bookDetailModel)
                                }
                            } label: {
                                BookView(book: book, vm: vm)
                            }

                            
                        }
                    }
                }
            }
        } .onAppear {
            self.vm.getBook(category: category)
        }
    }
}
//
//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(vm: CategoryViewModel())
//    }
//}
