//
//  UserImageView.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//

import SwiftUI

struct UserImageView: View {
    
    @StateObject var vm: UserImageViewModel = UserImageViewModel()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.secondary)
            }
            
        }
    }
}

//struct UserImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImageView()
//            .previewLayout(.sizeThatFits)
//    }
//}
