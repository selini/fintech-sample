//
//  StockUseCase.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 24/6/25.
//

protocol StockUseCase {
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void)
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, Error?, Int?) -> Void)
}

class StockUseCaseImpl: StockUseCase {
    let stockService:StockService
    
    init(stockService: StockService) {
        self.stockService = stockService
    }
    
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void) {
        stockService.getStocks(completionHandler: completionHandler)
    }
    
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, Error?, Int?) -> Void) {
        stockService.getStockDetails(symbol, completionHandler: completionHandler)
    }
}
