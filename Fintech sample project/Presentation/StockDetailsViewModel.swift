//
//  StockDetailsViewModel.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

class StockDetailsViewModel: ObservableObject {
    @Published var stock: Stock?
    @Published var shouldShowLoader: Bool = false
    private let useCase:StockUseCase
    
    init(stock: Stock, useCase: StockUseCase) {
        self.useCase = useCase
        self.stock = stock
    }
    
    public func getStockDetails() {
        shouldShowLoader = true
        useCase.getStockDetails { [weak self] stock, error, statusCode in
            guard let self else { return }
            shouldShowLoader = false
            self.stock = stock
        }
    }
}
