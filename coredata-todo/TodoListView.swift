//
//  TodoListView.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var vm: TodoViewModel
    
    var body: some View {
        List {
            ForEach(vm.todos, id: \.id) { todo in
                if let text = todo.text {
                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .onTapGesture {
                            print("Tap")
                        }
                }
            }
            .onDelete(perform: vm.deleteTodo(indexSet:))
        }
        .listStyle(PlainListStyle())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(vm: TodoViewModel())
    }
}
