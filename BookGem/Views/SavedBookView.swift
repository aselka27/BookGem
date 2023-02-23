//
//  SavedBookView.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//

import SwiftUI

struct SavedBookView: View {
    
    
    var body: some View {
        HStack {
           Image("gatsby")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text("It Ends With Us")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Holleen Cover")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

//struct SavedBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedBookView(book: )
//            .previewLayout(.sizeThatFits)
//    }
//}
