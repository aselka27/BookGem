//
//  CustomTabView.swift
//  BookGem
//
//  Created by саргашкаева on 21.02.2023.
//

import SwiftUI

var tabs = ["home", "favorite", "profile"]

struct CustomTabView: View {
    
    @State var selectedTab = "home"
    @State var edge = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag("home")
                FavoritesView()
                    .tag("favorite")
                ProfileView()
                    .tag("profile")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image  in
                    TabButton(image: image, selectedTab: $selectedTab)
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.15), radius: 5 , x: 5, y: 5)
            .shadow(color: .black.opacity(0.15), radius: 5 , x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, edge!.safeAreaInsets.bottom == 0 ? 20 : 0)
            // ignoring tab view elevation
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}


struct TabButton: View {
    
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            selectedTab = image
        } label: {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(selectedTab == image ? Color(.link) : Color.black.opacity(0.4))
                .padding()
        }
        
    }
}
