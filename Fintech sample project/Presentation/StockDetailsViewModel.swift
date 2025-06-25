//
//  StockDetailsViewModel.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

class StockDetailsViewModel: ObservableObject {
    @Published var stock: StockDetails?
    @Published var shouldShowLoader: Bool = false
    private let useCase:StockUseCase
    private let symbol: String
    
    init(symbol: String, useCase: StockUseCase) {
        self.useCase = useCase
        self.symbol = symbol
    }
    
    public func getStockDetails() {
       // shouldShowLoader = true
        useCase.getStockDetails(symbol) { [weak self] stock, error, statusCode in
            guard let self else { return }
           // shouldShowLoader = false
            self.stock = stock
        }
    }
}
