//
//  SuccessView .swift
//  BookGem
//
//  Created by саргашкаева on 10.03.2023.
//

import SwiftUI

// SPAlert 

struct SuccessView_: View {
    
   @State private var showsAlert = false
   
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
            Text("Your personal information has been updated")
                .padding(.horizontal)
                .padding(.top)
                .font(.headline)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
        .background(Color.gray.opacity(0.7))
        .cornerRadius(20)
    }
}

//struct SuccessView__Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessView_()
//    }
//}
