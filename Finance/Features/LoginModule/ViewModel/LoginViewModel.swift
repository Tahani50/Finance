//
//  LoginViewModel.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var user: User?
    @Published var error: String?
    
    private let userRepo: UserRepositoryProtocol
    
    init(userRepo: UserRepositoryProtocol? = nil) {
        self.userRepo = userRepo ?? UserRepository()
    }
    
    func login() {
        
        self.error = nil
        
        do {
            let user = try userRepo.login(name: name)
            self.user = user
            
        } catch {
            self.error = error.localizedDescription
        }
    }
}
