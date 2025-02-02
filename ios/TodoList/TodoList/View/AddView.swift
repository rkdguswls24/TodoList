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
    @State private var textContentFieldValue : String = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    
    
    var body: some View {
        VStack (spacing:15) {
            TextField("what to do?", text: $textFieldValue)
                .frame(height:55)
                .padding(.horizontal,8)
                .background(Color.gray.opacity(0.3),in:RoundedRectangle(cornerRadius: 10))
                
            TextField("write something...",text:$textContentFieldValue)
                .frame(width: .infinity, height: 200, alignment: .topLeading)
                .padding()
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
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
}

#Preview {
    AddView()
        .environment(ListViewModel())
}


extension AddView {
    private func saveButtonPressed() {
        if formValidate() {
            guard !textContentFieldValue.isEmpty else {
                listViewModel.addItem(title: textFieldValue)
                dismiss()
                return
            }
            listViewModel.addItem(title: textFieldValue, content: textContentFieldValue)
            dismiss()
            
        }
    }
    
    private func formValidate() -> Bool {
        if textFieldValue.count < 4 {
            alertTitle = "Error! you need to write a title at least 4 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}
