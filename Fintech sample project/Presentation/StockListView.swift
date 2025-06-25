//
//  StockListView.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

struct StockListView: View {
    @ObservedObject var viewModel = StockListViewModel(useCase: StockUseCaseImpl(stockService: StockServiceImpl()))
    
    var body: some View {
        NavigationStack {
            Text("Stocks").font(.title).padding()
            
            if viewModel.shouldShowLoader {
                ProgressView("Loading...")
                    .padding()
            }
            
            List(viewModel.stocks) { stock in
                NavigationLink(destination: StockDetailsView(symbol: stock.symbol)) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name ")
                            Text(stock.symbol)
                        }
                        HStack {
                            Text("Description")
                            Text(stock.description)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search stocks")
        .onAppear {
            viewModel.getStocks()
        }
    }
}

#Preview {
    StockListView()
}
