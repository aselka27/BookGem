//
//  ProfileView.swift
//  BookGem
//
//  Created by саргашкаева on 21.02.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
           profileHeader
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Image("woman")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack {
                            Text("Andrew Ainsley")
                                .fontWeight(.semibold)
                                .padding(.bottom, 2)
                                .padding(.trailing)
                            Text("@andrew_ainsley")
                                .foregroundColor(.gray)
                                .font(.callout)
                                .fontWeight(.regular)
                                .padding(.bottom)
                                .padding(.trailing)
                        
                        }
                        .padding([.leading], 5)
                        .padding(.top)
                        Spacer()
                        Button {
                            isPresented = true
                        } label: {
                            Text("Edit")
                                .foregroundColor(.brown)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(Color.brown, lineWidth: 2)
                                )
                                .padding(.bottom)
                        }
                        
                    }
                    .padding()
                    Text("Saved books")
                        .foregroundColor(.brown)
                        .fontWeight(.bold)
                        .font(.body)
                    Divider()
                        .frame(height: 2)
                        .background(Color.brown)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 1), spacing: 20) {
                        SavedBookView()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                }
                
                
            }
        }
        .sheet(isPresented: $isPresented) {
            EditView()
        }
        
    }
}

extension ProfileView {
    private var profileHeader: some View {
        HStack {
            Image("feather")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding([.leading])
            Text("Profile")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
}
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
