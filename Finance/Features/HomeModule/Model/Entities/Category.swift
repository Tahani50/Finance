//
//  Category.swift
//  Finance
//
//  Created by Tahani on 02/04/1447 AH.
//

import Foundation
import GRDB

enum Category: String, Codable, CaseIterable, Identifiable, DatabaseValueConvertible {
    case salary, business, gift, rewards, investment, other
    case supermarket, clothing, transport, house, shopping, entertainment, health, education, travel, work, restaurant
    var id: String { rawValue }

    static var incomeDefaults: [Category] { [.salary, .business, .gift, .investment, .rewards, .other] }
    static var expenseDefaults: [Category] { [.supermarket, .clothing, .transport, .house, .shopping, .entertainment, .health, .education, .travel, .work, .restaurant, .other] }
}
