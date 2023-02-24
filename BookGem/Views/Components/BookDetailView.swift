//
//  BookDetailView.swift
//  BookGem
//
//  Created by саргашкаева on 24.02.2023.
//

import SwiftUI

struct BookDetailView: View {
    @State var isSaved = false
    var body: some View {
           
        
            
            VStack {
                VStack(alignment: .center, spacing: 8) {
                    Image("gatsby")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width: 220, height: 300)
                    Text("Catcher in the Reye")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    Text("J.D. Salinger")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("When we can and cannot trust our intuitions in making business and personal decisions.")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                .padding(.top)
                
                Spacer()
                
                Button {
                    print("Buy Book")
                } label: {
                    Text("Buy on Amazon")
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                }
                .background(
                Rectangle()
                    .cornerRadius(12)
                    .frame(width: 120, height: 45)
                )
               
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

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetailView()
        }
    }
}
