//
//  Stocks.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation

  
struct Stock: Identifiable, Decodable {
    var id: String { symbol }
    let symbol: String
    let description: String
}
