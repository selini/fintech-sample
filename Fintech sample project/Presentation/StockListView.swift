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
            List(viewModel.stocks) { stock in
                NavigationLink(destination: StockDetailsView(stock: stock)) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name ")
                            Text(stock.shortName)
                        }
                        HStack {
                            Text("Price")
                            Text("\(stock.price)")
                                .fontWeight(.bold)
                        }
                        Text(stock.market)
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
