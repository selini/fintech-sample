//
//  StockDetailsViewModel.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

class StockDetailsViewModel: ObservableObject {
    @Published var stock: Stock?
    @Published public var shouldShowLoader: Bool?
    private let useCase:StockUseCase
    
    init(useCase: StockUseCase) {
        self.useCase = useCase
    }
    
    public func getStocks() {
        shouldShowLoader = true
        useCase.getStockDetails { [weak self] stock, error, statusCode in
            guard let self else { return }
            shouldShowLoader = false
            self.stock = stock
        }
    }
}
