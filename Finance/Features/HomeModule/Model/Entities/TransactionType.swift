//
//  TransactionType.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

enum TransactionType: String, Codable, CaseIterable, Identifiable, DatabaseValueConvertible {
    case income
    case expense
    var id: String { rawValue }
}
