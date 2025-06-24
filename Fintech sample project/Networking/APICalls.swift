//
//  APICalls.swift
//  Fintech sample project
//
//  Created by Selini Kyriazidou on 23/6/25.
//

import Combine
import Foundation

class APICalls {
    var cancellable = Set<AnyCancellable>()
    let helper = KeychainHelper()

    public init() {
        cancellable = Set<AnyCancellable>()
    }

    func post(
        url: URL,
        requestData: Data? = nil,
        authentication: Bool = true,
        completionHandler: @escaping (APIResponse) -> Void
    ) {
        genericCall(url, requestData, "POST", authentication) { apiResponse in
            completionHandler(apiResponse)
        }
    }

    func get(
        url: URL,
        requestData: Data?,
        authentication: Bool = true,
        completionHandler: @escaping (APIResponse) -> Void
    ) {
        genericCall(url, requestData, "GET", authentication) { apiResponse in
            completionHandler(apiResponse)
        }
    }

    private func genericCall(
        _ url: URL,
        _ requestData: Data? = nil,
        _ method: String,
        _ authentication: Bool,
        completionHandler: @escaping (APIResponse) -> Void
    ) {
        guard Reachability.isConnectedToNetwork() else {
            return completionHandler(APIResponse(nil, nil, .noNetwork))
        }
        var request = URLRequest(url: url)
        let headers = [
            "x-rapidapi-key": "a46dd4f060msh56817deff54f185p124a5fjsn2ea6efd70ee9",
            "x-rapidapi-host": "yh-finance.p.rapidapi.com"
        ]
        
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        request.httpBody = requestData
        let session = URLSession.shared

        session.dataTaskPublisher(for: request)
            .tryMap { element -> (APIResponse) in
                guard let response = element.response as? HTTPURLResponse
                else {
                    return APIResponse(element.data, 500, .badServerResponse)
                }
                return APIResponse(element.data, response.statusCode, nil)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(
                receiveCompletion: { status in
                    switch status {
                    case .finished: return
                    case let .failure(error):
                        print("Receiver error \(error)")
                    }
                },
                // receive the data
                receiveValue: { apiResponse in
                    print("----Api Call-----------", "\(method) \(url) \(apiResponse.statusCode ?? 0)")
                    completionHandler(apiResponse)
                }
            )
            .store(in: &cancellable)
    }
}
