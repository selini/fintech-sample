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
        List(viewModel.stocks){ stock in
            VStack{
                Text(stock.shortName)
                    .font(.body)
                Text(stock.market)
                    .font(.callout)
            }
        }.onAppear {
            viewModel.getStocks()
        }
    }
}

#Preview {
    StockListView()
}
