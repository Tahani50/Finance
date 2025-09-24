//
//  FinanceApp.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import SwiftUI

@main
struct FinanceApp: App {
    
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if loginVM.user == nil {
                    LoginView(viewModel: loginVM)
                } else {
                    ContentView(viewModel: loginVM)
                }
            }
        }
    }
}
