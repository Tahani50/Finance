//
//  Transaction.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

struct Transaction: Codable, Identifiable, FetchableRecord, PersistableRecord {
    var id: Int64?
    var title: String
    var amount: Double
    var date: Date
    var category: Category
    var type: TransactionType
    var userId: Int64
    
    static let databaseTableName = "transaction"
}
