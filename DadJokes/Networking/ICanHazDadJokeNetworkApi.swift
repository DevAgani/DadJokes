//
//  ICanHazDadJokeNetworkApi.swift
//  DadJokes
//
//  Created by George  on 18/02/2021.
//

import Foundation

final class ICanHazDadJokeNetworkApi: NetworkProtocol {
    func fetchRandomDadJoke(completionHandler: @escaping (Result<DadJoke, Error>) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let endpoint = "https://icanhazdadjoke.com"
        
        guard let endpointURL = URL(string: endpoint) else {
//            completionHandler(.failure)
            return
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTasks = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let jsonData = data else {
                return
            }
            // decode
            let jsonDecoder = JSONDecoder()
            
            do {
                let joke = try jsonDecoder.decode(DadJoke.self, from: jsonData)
                completionHandler(.success(joke))
                
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        dataTasks.resume()
    }
}
