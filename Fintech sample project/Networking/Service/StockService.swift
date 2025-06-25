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
    func getStockDetails(completionHandler: @escaping (Stock?, (Error)?, Int? ) -> Void)
}

class StockServiceImpl: StockService {
    var cancellable = Set<AnyCancellable>()
    var apiCall = APICalls()
    
    func getStocks(completionHandler: @escaping ([Stock], (Error)?, Int? ) -> Void) {
        let url = URL(string: "https://yh-finance.p.rapidapi.com/market/v2/get-summary")!
        apiCall.get(url: url, requestData: nil) { apiResponse in
            guard let data = apiResponse.data,
                  let response = try? JSONDecoder().decode([Stock].self, from: data)
            else {
                return completionHandler([], .badServerResponse, apiResponse.statusCode)
            }
            return completionHandler(response, apiResponse.error, apiResponse.statusCode)
        }
        
    }
    
    func getStockDetails(completionHandler: @escaping (Stock?, (Error)?, Int? ) -> Void) {
        let url = URL(string: "https://yh-finance.p.rapidapi.com/stock/v2/get-summary")!
        apiCall.get(url: url, requestData: nil) { apiResponse in
            guard let data = apiResponse.data,
                  let response = try? JSONDecoder().decode(Stock.self, from: data)
            else {
                return completionHandler(nil, .badServerResponse, apiResponse.statusCode)
            }
            return completionHandler(response, apiResponse.error, apiResponse.statusCode)
        }
        
    }
}
