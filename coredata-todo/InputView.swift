//
//  InputView.swift
//  coredata-todo
//
//  Created by Irfan Izudin on 18/01/23.
//

import SwiftUI

struct InputView: View {
    
    @StateObject var vm = TodoViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter text here...", text: $vm.text)
                .autocorrectionDisabled()
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.indigo)
                }
            Button {
                //add
            } label: {
                Text("Add")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .cornerRadius(5)
            }

        }
        .padding(.horizontal, 15)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
