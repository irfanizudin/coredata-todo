//
//  ContentView.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = TodoViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                InputView(vm: vm)
                TodoListView(vm: vm)
            }
            .navigationTitle("Coredata Todo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
