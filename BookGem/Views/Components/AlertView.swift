//
//  AlertView.swift
//  BookGem
//
//  Created by саргашкаева on 9.03.2023.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        VStack {
            Image("alert")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top)
            
            Spacer()
            
            Text("You are about to use external link.")
            
            Spacer()
            Divider()
            
            HStack {
                Spacer()
                Button("Continue") {
                    //
                }
                
                Spacer()
              
                Button("Cancel") {
                    //
                }
                Spacer()
                
            }
            .padding(.bottom)
          
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
        .background(Color.brown.opacity(0.7))
        .cornerRadius(20)
    }
}

//struct AlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertView()
//    }
//}
