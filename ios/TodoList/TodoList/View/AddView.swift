//
//  AddView.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(ListViewModel.self) var listViewModel
    
    @State private var textFieldValue: String = ""
    
    var body: some View {
        VStack (spacing:15) {
            TextField("what to do?", text: $textFieldValue)
                .frame(height:55)
                .padding(.horizontal,8)
                .background(Color.gray.opacity(0.3),in:RoundedRectangle(cornerRadius: 10))
                
            Button {
                saveButtonPressed()
            } label: {
                Text("Save")
                    .foregroundStyle(Color.primary)
                    .font(.headline)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .background(Color("CustomColor"),in:RoundedRectangle(cornerRadius: 10))
            }
            Spacer()

            
        }
        .padding()
    }
}

#Preview {
    AddView()
        .environment(ListViewModel())
}


extension AddView {
    private func saveButtonPressed() {
        guard !textFieldValue.isEmpty else { return }
        listViewModel.addItem(title: textFieldValue)
        dismiss()
    }
}
