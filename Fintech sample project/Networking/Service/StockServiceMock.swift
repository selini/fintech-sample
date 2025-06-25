//
//  Untitled.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 24/6/25.
//

final class StockServiceMock: StockService {
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, Error?, Int?) -> Void) {
        let stockDetails = StockDetails(
            name: "Apple Inc",
            ticker: "AAPL",
            logo: "https://static.finnhub.io/logo/2b7c9cf0-apple.png",
            finnhubIndustry: "Technology"
        )
        completionHandler(stockDetails, nil, 200)
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
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void) {
        completionHandler([], .badServerResponse, 400)
    }
        
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, Error?, Int?) -> Void) {
        completionHandler(nil, .badServerResponse, 400)
    }
}
