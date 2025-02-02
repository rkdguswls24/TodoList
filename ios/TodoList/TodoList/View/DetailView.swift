//
//  DetailView.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var item:ItemModel
    let emptyMemo: String = "empty memo..."
    @State var textContentFieldValue: String = ""
    @State var textTitleFieldValue: String = ""
    @State var isEditingMode:Bool = false
    
    var body: some View {
        ScrollView {
            
            if isEditingMode {
                editMode
            }
            else {
                readMode
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation {
                        if isEditingMode {
                            doneButtonPressed()
                        }
                        isEditingMode.toggle()
                    }
                    
                    
                } label: {
                    Text(isEditingMode ? "Done" : "Edit")
                }

            }
        }
    }
    
    
}

#Preview {
    NavigationStack {
        
        DetailView(item:ItemModel(title: "hello1 dfslkjf this i s long sdfktitel dform the skljdf multi line scriopt", isCompleted: true))
            .environment(ListViewModel())
    }
    
}

extension DetailView {
    private var readMode: some View {
        VStack(alignment: .center,spacing:10) {
            
            Text(item.title)
                .lineLimit(2)
                .font(.headline)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            Divider()
            // 텍스트 필드
            Text(item.content.isEmpty ? "write something..." : item.content)
                .frame(width: 300, height: 200, alignment: .topLeading)
                .foregroundStyle(Color.gray)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
        }
    }
    
    private var editMode: some View {
        VStack(alignment: .center,spacing:10) {
            
            TextEditor(text:$textTitleFieldValue)
                .onAppear{
                    textTitleFieldValue = textTitleFieldValue.isEmpty ? item.title : textTitleFieldValue
                }
                .lineLimit(2)
                .font(.headline)
                .frame(maxWidth:.infinity,alignment: .leading)
                .onTapGesture {
                    
                }
            
            Divider()
            // 텍스트 필드
            TextEditor(text:$textContentFieldValue)
                .onAppear {
                    textContentFieldValue = textContentFieldValue.isEmpty ? item.content : textContentFieldValue
                }
                .frame(width: 300, height: 200, alignment: .topLeading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
        }
    }
    
   
}
extension DetailView {
    private func doneButtonPressed() {
        listViewModel.updateItem(item: item, title: textTitleFieldValue, content: textContentFieldValue)
    }
}
