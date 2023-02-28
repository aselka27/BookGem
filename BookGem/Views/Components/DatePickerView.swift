//
//  DatePickerView.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import SwiftUI

struct DatePickerView: View {
    
   @State private var selectedDate: Date = Date()
   
    var body: some View {
        DatePicker(selection: $selectedDate, displayedComponents: [.date]) {
            Text("Select date: ")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.leading)
        }
        .datePickerStyle(.compact)
    }
}

//struct DatePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        DatePickerView()
//            .previewLayout(.sizeThatFits)
//    }
//}
