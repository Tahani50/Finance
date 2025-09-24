//
//  User.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

struct User: Codable, FetchableRecord, PersistableRecord, Identifiable {
    var id: Int64?
    var name: String

    static let databaseTableName = "user"
}
