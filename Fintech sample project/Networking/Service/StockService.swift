//
//  StockService.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation
import Combine

protocol StockService {
    func getStocks(completionHandler: @escaping ([Stocks], Error?, Int?) -> Void)
}

class StockServiceImpl: StockService {
    let url = URL(string: "https://yh-finance.p.rapidapi.com/market/v2")!
    var cancellable = Set<AnyCancellable>()
    var apiCall = APICalls()
    
    func getStocks(completionHandler: @escaping ([Stocks], (Error)?, Int? ) -> Void) {
        apiCall.get(url: url.appendingPathComponent("get-summary"), requestData: nil) { apiResponse in
            guard let data = apiResponse.data,
                  let response = try? JSONDecoder().decode([Stocks].self, from: data)
            else {
                if apiResponse.statusCode == 400 {
                    return completionHandler([], nil, apiResponse.statusCode)
                } else {
                    return completionHandler([], .badServerResponse, apiResponse.statusCode)
                }
            }
            return completionHandler(response, apiResponse.error, apiResponse.statusCode)
        }
        
    }
}
