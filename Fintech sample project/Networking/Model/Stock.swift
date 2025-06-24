//
//  Stocks.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation

struct Stock: Identifiable,Decodable {
    var id = UUID()
    let shortName: String
    let price: Int
    let market: String
}


//      {
//        "exchangeTimezoneName": "America/New_York",
//        "fullExchangeName": "SNP",
//        "symbol": "^GSPC",
//        "gmtOffSetMilliseconds": -18000000,
//        "exchangeDataDelayedBy": 0,
//        "firstTradeDateMilliseconds": -1325583000000,
//        "language": "en-US",
//        "regularMarketTime": {
//          "raw": 1645027268,
//          "fmt": "11:01AM EST"
//        },
//        "exchangeTimezoneShortName": "EST",
//        "quoteType": "INDEX",
//        "marketState": "REGULAR",
//        "market": "us_market",
//        "spark": {
//          "previousClose": 4471.07,
//          "chartPreviousClose": 4471.07,
//          "symbol": "^GSPC",
//          "timestamp": [
//            1645021800,
//            1645022100,
//            1645022400,
//            1645022700,
//            1645023000,
//            1645023300,
//            1645023600,
//            1645023900,
//            1645024200,
//            1645024500,
//            1645024800,
//            1645025100,
//            1645025400,
//            1645025700,
//            1645026000,
//            1645026300,
//            1645026600,
//            1645026900,
//            1645027251
//          ],
//          "close": [
//            4455.68,
//            4452.96,
//            4449.28,
//            4449.66,
//            4436.98,
//            4437.69,
//            4439.34,
//            4440.07,
//            4439.83,
//            4435.6,
//            4439.54,
//            4442.41,
//            4442.45,
//            4442.41,
//            4443.71,
//            4440.84,
//            4443.57,
//            4439.47,
//            4439.88
//          ],
//          "dataGranularity": 300,
//          "end": 1645045200,
//          "start": 1645021800
//        },
//        "priceHint": 2,
//        "tradeable": false,
//        "sourceInterval": 15,
//        "exchange": "SNP",
//        "shortName": "S&P 500",
//        "region": "US",
//        "triggerable": false,
//        "regularMarketPreviousClose": {
//          "raw": 4471.07,
//          "fmt": "4,471.07"
//        }
//      },

