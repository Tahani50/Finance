//
//  DatabaseManager.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    let dbQueue: DatabaseQueue

    private init() {
        do {
            let databaseURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("finance.sqlite")
            dbQueue = try DatabaseQueue(path: databaseURL.path)
            try migrator.migrate(dbQueue)
        } catch {
            fatalError("Database init failed: \(error)")
        }
    }

    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        migrator.registerMigration("v1") { db in
            try db.create(table: "user") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                    .notNull()
                    .unique()
            }
        }

        
        migrator.registerMigration("v2_create_transaction") { db in
                  try db.create(table: "transaction") { t in
                      t.autoIncrementedPrimaryKey("id")
                      t.column("title", .text).notNull()
                      t.column("amount", .double).notNull()
                      t.column("date", .date).notNull()
                      t.column("category", .text).notNull()
                      t.column("type", .text).notNull()
                      t.column("userId", .integer)
                          .notNull()
                          .indexed()
                          .references("user", onDelete: .cascade)
                  }
              }
        return migrator
    }
}
