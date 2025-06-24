//
//  StockUseCase.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 24/6/25.
//

protocol StockUseCase {
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void)
    func getStockDetails(completionHandler: @escaping (Stock, Error?, Int?) -> Void)
}

class StockUseCaseImpl: StockUseCase {
    let stockService:StockService
    
    init(stockService: StockService) {
        self.stockService = stockService
    }
    
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void) {
        let stocks = [Stock(shortName: "test 1", price: 10, market: "us"),
                      Stock(shortName: "test 2", price: 15, market: "us"),
                      Stock(shortName: "test 3", price: 20, market: "us"),
                      Stock(shortName: "test 4", price: 15, market: "us")
        ]
        completionHandler(stocks, nil, 200)
        //stockService.getStocks(completionHandler: completionHandler)
    }
    
    func getStockDetails(completionHandler: @escaping (Stock, Error?, Int?) -> Void) {
        completionHandler(Stock(shortName: "test 1", price: 10, market: "us"), nil, 200)
        //stockService.getStocks(completionHandler: completionHandler)
    }
}
