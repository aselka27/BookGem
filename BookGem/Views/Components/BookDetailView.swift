//
//  BookDetailView.swift
//  BookGem
//
//  Created by саргашкаева on 24.02.2023.
//

import SwiftUI

struct BookDetailView: View {
    @State var isSaved = false
    private let bookDetailModel: BookDetail
    init(bookDetailModel: BookDetail) {
        self.bookDetailModel = bookDetailModel
    }
   
    var body: some View {
           
        
            
            VStack {
                VStack(alignment: .center, spacing: 8) {
//                    Image("gatsby")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(20)
//                        .frame(width: 220, height: 300)
                    BookCoverView(isbn: bookDetailModel.primaryIsbn13 ?? "")
                    Text(bookDetailModel.title ?? "N/A")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                    Text(bookDetailModel.author ?? "N/A")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(bookDetailModel.description ?? "N/A")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("When we can and cannot trust our intuitions in making business and personal decisions.")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                .padding(.top)
                .padding(.horizontal)
                
                Spacer()
                Button {
                    print("Buy Book")
                } label: {
                    Text("Buy on Amazon")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.top)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSaved.toggle()
                    } label: {
                        if isSaved {
                            Image(systemName: "bookmark.fill")
                                .fontWeight(.bold)
                        } else {
                            Image(systemName: "bookmark")
                                .fontWeight(.bold)
                        }
                       
                    }

                    
                }
                
            }
        }
    
}

//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            BookDetailView()
//        }
//    }
//}
