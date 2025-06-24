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
        VStack {
            HStack {
                Text("Name ")
                Text(viewModel.stock?.shortName ?? "")
            }
        }
    }
}

#Preview {
    StockDetailsView(stock: Stock(shortName: "", price: 0, market: ""))
}
