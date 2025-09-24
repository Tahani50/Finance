//
//  UserRepositoryProtocol.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation

protocol UserRepositoryProtocol {
    func login(name: String) throws -> User
    func currentUser(id: Int64) throws -> User?
}
