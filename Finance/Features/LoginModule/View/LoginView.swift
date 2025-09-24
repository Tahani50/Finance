//
//  LoginView.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        
        Form {
            Section("Welcome") {
                
                TextField("Name", text: $viewModel.name)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
            }

            if let e = viewModel.error {
                Text(e).foregroundColor(.red)
            }

            Button {
                viewModel.login()
            } label: {
                Text("Log In")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.name.isEmpty)
        }
        .navigationTitle("Login")
    }
}
