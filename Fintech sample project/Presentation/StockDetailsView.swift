//
//  StockDetailsView.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import SwiftUI

struct StockDetailsView: View {
    @ObservedObject var viewModel: StockDetailsViewModel
    
    init(symbol: String) {
        viewModel = StockDetailsViewModel(symbol: symbol, useCase: StockUseCaseImpl(stockService: StockServiceImpl()))
    }
    
    var body: some View {
        if viewModel.shouldShowLoader {
            ProgressView("Loading...")
                .padding()
        }
        Text("Stock Details")
            .font(.title)
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: viewModel.stock?.logo ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 100)
                @unknown default:
                    EmptyView()
                }
            }
            HStack {
                Text ("Name")
                Text(viewModel.stock?.name ?? "")
            }
            HStack {
                Text ("Ticker")
                Text(viewModel.stock?.ticker ?? "")
            }
            HStack {
                Text ("Industry")
                Text(viewModel.stock?.finnhubIndustry ?? "")
            }
            Spacer()
            
        }
        .onAppear {
            viewModel.getStockDetails()
        }
    }
}

#Preview {
    StockDetailsView(symbol: "")
}
