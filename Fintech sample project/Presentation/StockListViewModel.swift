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
    @Published var shouldShowLoader: Bool = false
    private let useCase:StockUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: StockUseCase) {
        self.useCase = useCase
        handlePublished()
        setupTimer()
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
    
    private func setupTimer() {
        Timer
            .publish(every: 8, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                print("reload stocks")
                self?.getStocks()
            }
            .store(in: &cancellables)
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

