//
//  UserRepository.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

final class UserRepository: UserRepositoryProtocol {
    
    private let dbQueue: DatabaseQueue
    
    init(dbQueue: DatabaseQueue = DatabaseManager.shared.dbQueue) {
        self.dbQueue = dbQueue
    }
    
    func login(name: String) throws -> User {
        let cleaned = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !cleaned.isEmpty else {
            throw NSError(domain: "Login", code: 1, userInfo: [NSLocalizedDescriptionKey: "Name cannot be empty"])
        }
        
        return try dbQueue.write { db in
            
            if let existing = try User
                .filter(Column("name") == cleaned)
                .fetchOne(db) {
                
                return existing
            }
            
            // 2) Not found → create
            let newUser = User(id: nil, name: cleaned)
            try newUser.insert(db)
            return newUser
        }
    }
    
    func currentUser(id: Int64) throws -> User? {
        try dbQueue.read { db in
            try User.fetchOne(db, key: id)
        }
    }
}
