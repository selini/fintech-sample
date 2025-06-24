//
//  StockListViewModel.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//
import SwiftUI

class StockListViewModel: ObservableObject {
    @Published var stocks: [Stock] = []
    @Published public var shouldShowLoader: Bool?
    private let useCase:StockUseCase
    
    init(useCase: StockUseCase) {
        self.useCase = useCase
    }
    
    public func getStocks() {
        shouldShowLoader = true
        useCase.getStocks { [weak self] stocks, error, statusCode in
            guard let self else { return }
            shouldShowLoader = false
            self.stocks = stocks
        }
    }
}

