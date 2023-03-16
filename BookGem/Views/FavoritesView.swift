//
//  FavoriteView.swift
//  BookGem
//
//  Created by саргашкаева on 21.02.2023.
//

import SwiftUI


enum ViewStates {
    case loading
    case sucsess
    case error
}

struct FavoritesView: View {
    
    @State var txt = ""
    
    var item = [GridItem(.adaptive(minimum: 70), spacing: 10)]
    @StateObject var vm = DiscoverViewModel()
  
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                navBar
                SearchView(textSearch: $vm.searchText)
                bookList
            }
            .padding(.bottom, 60)
        }
        .onAppear {
//            vm.getBestSeller("Harry Potter")
        }
       
    }
}

extension FavoritesView {
    private var navBar: some View {
        HStack {
            Text("Discover")
                .font(.title)
                .fontWeight(.bold)
           Spacer()
        }
        .padding(.leading)
    }

    private var bookList: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 1), alignment: .leading, spacing: 20) {
            
                ForEach(vm.bestSellers, id: \.title) { book in
                    QueryView(book: book)
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .padding(.top)
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}


