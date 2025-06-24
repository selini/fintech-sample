//
//  Error.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation
import SwiftUI

enum Error: Identifiable {
    var id: Self { self }

    case noNetwork
    case badServerResponse

    var alert: Alert {
        switch self {
        case .noNetwork:
            Alert(title: Text(String(localized: "no_internet")))
        case .badServerResponse:
            Alert(title: Text(String(localized: "error")))
        }
    }
}
