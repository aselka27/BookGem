//
//  MainView.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import SwiftUI

struct HomeView: View {
    @State var txt = ""
    @State var edge = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }
    var bookList = [BookList]()
    let vm: HomeViewModel
    var body: some View {
        VStack {
           navBar
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Book Genres", text:  $txt)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                    HStack {
                        Text("Categories")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer(minLength: 0)
                        Button {
                            //
                        } label: {
                            Text("View All")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                        ForEach(BookList.allCases, id: \.name) { category in
                            NavigationLink {
                                CategoryView(category: category)
                            } label: {
                                BookCategoryView(bookCategory: category)
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .padding(.bottom, edge!.safeAreaInsets.bottom + 70)
            }
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all,  edges: .all))
        .onTapGesture {
            dismissKeyboard()
        }
    }
    
    func dismissKeyboard() {
        edge?.endEditing(true)// 4
       }
}

extension HomeView {
    private var navBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Hello Asel")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Find your favorite books")
            }
            .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image("woman")
                .resizable()
                .renderingMode(.original)
                .frame(width: 50, height: 50)
        }
        .padding()
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}










