//
//  TransactionRepository.swift
//  Finance
//
//  Created by Naif on 02/04/1447 AH.
//


import Foundation
import GRDB

final class TransactionRepository: TransactionRepositoryProtocol {
    
    private let dbQueue: DatabaseQueue
    init(dbQueue: DatabaseQueue = DatabaseManager.shared.dbQueue) { self.dbQueue = dbQueue }
    
    func addTransaction(_ transaction: Transaction) throws {
        try dbQueue.write { db in
            var mutable = transaction
            try mutable.insert(db)
        }
    }
    
    func getBalance( userId: Int64) throws -> Double {
        try dbQueue.read { db in
            let sql = """
            SELECT COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE -amount END), 0)
            FROM "transaction"
            WHERE userId = ?
            """
            return try Double.fetchOne(db, sql: sql, arguments: [userId]) ?? 0.0
        }
    }
    
    func fetchAllTransactions( userId: Int64, limit: Int) throws -> [Transaction] {
        try dbQueue.read { db in
            try Transaction
                .filter(Column("userId") == userId)
                .order(Column("date").desc, Column("id").desc)
                .limit(limit)
                .fetchAll(db)
        }
    }
}
