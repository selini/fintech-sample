//
//  Untitled.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 24/6/25.
//

final class StockServiceMock: StockService {
    func getStockDetails(completionHandler: @escaping (Stock?, Error?, Int?) -> Void) {
        completionHandler(Stock(symbol: "test 1", description: "us"), nil, 200)
    }
    
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void) {
        let stocks = [Stock(symbol: "test 1", description: "us"),
                      Stock(symbol: "test 2", description: "us"),
                      Stock(symbol: "test 3", description: "us"),
                      Stock(symbol: "test 4", description: "us")
        ]
        completionHandler(stocks, nil, 200)
    }
    
}

final class StockServiceFailedMock: StockService {
    func getStockDetails(completionHandler: @escaping (Stock?, Error?, Int?) -> Void) {
        completionHandler(nil, .badServerResponse, 400)
    }
    
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void) {
        completionHandler([], .badServerResponse, 400)
    }
}
