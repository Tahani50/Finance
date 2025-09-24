//
//  TransactionRepositoryProtocol.swift
//  Finance
//
//  Created by Naif on 02/04/1447 AH.
//

protocol TransactionRepositoryProtocol {
    func addTransaction(_ transaction: Transaction) throws
    func fetchAllTransactions( userId: Int64, limit: Int) throws -> [Transaction] 
    func getBalance( userId: Int64) throws -> Double
}


