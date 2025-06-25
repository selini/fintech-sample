//
//  Fintech_sample_projectTests.swift
//  Fintech sample projectTests
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Testing
@testable import Fintech_sample_project

struct Fintech_sample_projectTests {
    private var useCase: StockUseCase {
        StockUseCaseImpl(stockService: StockServiceMock())
    }
    
    private var useCaseFailed: StockUseCase {
        StockUseCaseImpl(stockService: StockServiceFailedMock())
    }

    @Test func successfulGetStocks() {
        useCase.getStocks { _, error, _ in
            #expect(error == nil)
        }
    }

    @Test func unsuccessfulGetStocks() {
        useCaseFailed.getStocks { _, error, _ in
            #expect(error != nil)
        }
    }
    
    @Test func successfulGetStockDetails() {
        useCase.getStockDetails { _, error, _ in
            #expect(error == nil)
        }
    }

    @Test func unsuccessfulGetStockDetails() {
        useCaseFailed.getStockDetails { _, error, _ in
            #expect(error != nil)
        }
    }

}
