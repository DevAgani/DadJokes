//
//  NetworkingProtocol.swift
//  DadJokes
//
//  Created by George  on 18/02/2021.
//

import Foundation

protocol NetworkProtocol {
    func fetchRandomDadJoke(completionHandler: @escaping (Result<DadJoke, Error>) -> Void)
}

struct DadJoke: Codable {
    var id: String?
    var joke: String?
}
