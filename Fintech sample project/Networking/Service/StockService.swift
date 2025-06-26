//
//  StockService.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation
import Combine

protocol StockService {
    func getStocks(completionHandler: @escaping ([Stock], Error?, Int?) -> Void)
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, (Error)?, Int? ) -> Void)
}

class StockServiceImpl: StockService {
    private var cancellable = Set<AnyCancellable>()
    private var apiCall = APICalls()
   
    func getStocks(completionHandler: @escaping ([Stock], (Error)?, Int? ) -> Void) {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else { return }
        let url = URL(string: "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=\(apiKey)")!
        apiCall.get(url: url, requestData: nil) { apiResponse in
            guard let data = apiResponse.data,
                  let response = try? JSONDecoder().decode([Stock].self, from: data)
            else {
                return completionHandler([], .badServerResponse, apiResponse.statusCode)
            }
            return completionHandler(response, apiResponse.error, apiResponse.statusCode)
        }
        
    }
    
    func getStockDetails(_ symbol: String, completionHandler: @escaping (StockDetails?, (Error)?, Int? ) -> Void) {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else { return }
        let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=\(symbol)&token=\(apiKey)")!
        apiCall.get(url: url, requestData: nil) { apiResponse in
            guard let data = apiResponse.data,
                  let response = try? JSONDecoder().decode(StockDetails.self, from: data)
            else {
                return completionHandler(nil, .badServerResponse, apiResponse.statusCode)
            }
            return completionHandler(response, apiResponse.error, apiResponse.statusCode)
        }
        
    }
}
