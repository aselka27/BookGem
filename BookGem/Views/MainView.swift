//
//  MainView.swift
//  BookGem
//
//  Created by саргашкаева on 21.02.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            CustomTabView()
                .toolbar(.hidden)
        }
       
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
