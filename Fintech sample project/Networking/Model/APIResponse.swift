//
//  APIResponse.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Foundation

struct APIResponse {
    let data: Data?
    let statusCode: Int?
    let error: Error?

    public init(_ data: Data?, _ statusCode: Int?, _ error: Error?) {
        self.data = data
        self.statusCode = statusCode
        self.error = error
    }
}
