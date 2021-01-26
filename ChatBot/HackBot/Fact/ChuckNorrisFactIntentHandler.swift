//
//  ChuckNorrisFactIntentHandler.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

final class ChuckNorrisFactIntentHandler: IntentHandling {

    private static let chuckNorrisFactEndpoint = URL(string: "https://api.chucknorris.io/jokes/random")!

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    func handle(utterance: String, completion: @escaping (Result<String, IntentHandlerError>) -> Void) {
        urlSession.dataTask(with: Self.chuckNorrisFactEndpoint) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            if let error = error {
                completion(.failure(IntentHandlerError(error: error)))
                return
            }

            guard let data = data, let fact = try? self.jsonDecoder.decode(ChuckNorrisFactResponse.self, from: data) else {
                completion(.failure(IntentHandlerError(message: "Something when wrong")))
                return
            }

            completion(.success(fact.value))
        }
        .resume()
    }

}

struct ChuckNorrisFactResponse: Decodable {

    let value: String

}
