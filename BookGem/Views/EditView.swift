//
//  EditView.swift
//  BookGem
//
//  Created by саргашкаева on 7.03.2023.
//

import SwiftUI

struct EditView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @StateObject var viewModel = EditViewModel()

    
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(GradientTextFieldStyle(systemImage: "person"))
                .padding()
     
            Text(viewModel.emptyNameMessage)
                .foregroundColor(.red)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(GradientTextFieldStyle(systemImage: "person"))
                .padding()
            
            
            Button {
                //
            }
          
        label: {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 7)
                    }
                    
            }
            
        .disabled(!viewModel.isButtonEnabled)
        }
        .padding(.horizontal)
    }
}


struct GradientTextFieldStyle: TextFieldStyle {
    
    let systemImage: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    LinearGradient(colors: [.mint, .cyan], startPoint: .leading, endPoint: .trailing)
                
                )
                .frame(height: 40)
            HStack {
                Image(systemName: systemImage)
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
    }
}

struct UnderlineTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                VStack {
                    Spacer()
                    Color.mint
                        .frame(height: 2)
                }
            
            
            )
    }
}


struct SecureTextField: View {
    
    @State private var isSecure = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField("Enter your password...", text: $text)
                    .textFieldStyle(UnderlineTextFieldStyle())
            } else {
                TextField(text, text: $text)
                    .textFieldStyle(UnderlineTextFieldStyle())
            }
        }
        .overlay(alignment: .trailing) {
            Image(systemName: isSecure ? "eye.slash" : "eye" )
                .padding(.trailing, 8)
                .foregroundColor(.gray)
                .onTapGesture {
                    isSecure.toggle()
                }
        }
    }
}


struct DefaultButtonViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
