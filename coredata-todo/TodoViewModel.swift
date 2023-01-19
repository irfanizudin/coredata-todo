//
//  TodoViewModel.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import Foundation
import CoreData

class TodoViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var todos: [TodoApp] = []
    @Published var editedId: String = ""
    @Published var editedText: String = ""
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoAppModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("failed to load core data = ", error.localizedDescription)
            }
        }
        getAllTodos()
    }
    
    func getAllTodos() {
        let request = NSFetchRequest<TodoApp>(entityName: "TodoApp")
        do {
            todos = try container.viewContext.fetch(request)
        } catch let error {
            print("failed to get todos = ", error.localizedDescription)
        }
    }
    
    func addTodo(text: String) {
        let newTodo = TodoApp(context: container.viewContext)
        newTodo.id = UUID().uuidString
        newTodo.text = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            getAllTodos()
        } catch let error {
            print("failed to save data", error)
        }
    }
    
    func deleteTodo(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let todoItem = todos[index]
        container.viewContext.delete(todoItem)
        saveData()
    }
    
    func updateTodo(id: String, text: String) {
        let editedText = todos.filter({ $0.id == id })
        editedText.first?.text = text
        saveData()
    }
}
