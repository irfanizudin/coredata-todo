//
//  TodoViewModel.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var text: String = ""
}
