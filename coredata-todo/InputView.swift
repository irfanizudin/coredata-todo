//
//  InputView.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import SwiftUI

struct InputView: View {
    
    @ObservedObject var vm: TodoViewModel
    @FocusState var fieldFocus: Bool
    
    var body: some View {
        VStack {
            TextField("Enter text here...", text: vm.editedText.isEmpty ? $vm.text : $vm.editedText)
                .autocorrectionDisabled()
                .focused($fieldFocus)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.indigo)
                }
            Button {
                if vm.editedText.isEmpty {
                    vm.addTodo(text: vm.text)
                    vm.text = ""
                } else {
                    vm.updateTodo(id: vm.editedId, text: vm.editedText)
                    vm.editedText = ""
                }
            } label: {
                Text(vm.editedText.isEmpty ? "Add" : "Update")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(vm.text.isEmpty ? Color.gray : Color.indigo)
                    .cornerRadius(5)
            }
            .disabled(vm.text.isEmpty)
            
        }
        .padding(.horizontal, 15)
        .onChange(of: vm.editedText) { _ in
            fieldFocus = true
            vm.text = vm.editedText
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(vm: TodoViewModel())
    }
}
