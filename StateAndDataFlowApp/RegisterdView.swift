//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    private var symbolCounter: Int {
        name.count
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .offset(x: 30)
                Text("\(symbolCounter)")
                    .padding(.horizontal)
                    .foregroundColor(symbolCounter < 3 ? Color.red : Color.green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(symbolCounter < 3 ? true : false)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
            .environmentObject(UserManager())
    }
}
