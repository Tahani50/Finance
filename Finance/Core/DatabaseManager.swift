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
            
            var config = Configuration()
            config.prepareDatabase { db in
                try db.execute(sql: "PRAGMA foreign_keys = ON")
            }
            
            dbQueue = try DatabaseQueue(path: databaseURL.path, configuration: config)
            
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
                    .collate(.nocase)
                    .unique()
            }
        }
        
        return migrator
    }
}
