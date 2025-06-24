//
//  StockListViewModel.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//
import SwiftUI
import Combine

class StockListViewModel: ObservableObject {
    @Published var stocks: [Stock] = []
    @Published var allStocks: [Stock] = []
    @Published var searchText = ""
    @Published public var shouldShowLoader: Bool?
    private let useCase:StockUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: StockUseCase) {
        self.useCase = useCase
        handlePublished()
    }
    
    private func handlePublished() {
        $searchText
            .removeDuplicates()
            .sink(receiveValue: { [weak self] searchText in
                guard let self else { return }
                if searchText.isEmpty {
                    stocks = allStocks
                } else {
                    stocks = stocks.filter { $0.shortName.localizedCaseInsensitiveContains(searchText) }
                }
            }).store(in: &cancellables)
    }
    
    public func getStocks() {
        shouldShowLoader = true
        useCase.getStocks { [weak self] stocks, error, statusCode in
            guard let self else { return }
            shouldShowLoader = false
            self.allStocks = stocks
            self.stocks = stocks
        }
    }
}

