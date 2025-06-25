//
//  StockDetailsView.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

struct StockDetailsView: View {
    @ObservedObject var viewModel: StockDetailsViewModel
    
    init(stock: Stock) {
        viewModel = StockDetailsViewModel(stock: stock, useCase: StockUseCaseImpl(stockService: StockServiceImpl()))
    }
    
    var body: some View {
        if viewModel.shouldShowLoader {
            ProgressView("Loading...")
                .padding()
        }
        
        VStack {
            HStack {
                Text("Name ")
                Text(viewModel.stock?.symbol ?? "")
            }
        }
        .onAppear{
            viewModel.getStockDetails()
        }
    }
}

#Preview {
    StockDetailsView(stock: Stock(symbol: "test 1", description: "us"))
}
