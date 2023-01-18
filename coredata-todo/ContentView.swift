//
//  ContentView.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
              InputView()
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
