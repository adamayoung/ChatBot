//
//  HelloIntentHandler.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

final class HelloIntentHandler: IntentHandling {

    func handle(utterance: String, completion: @escaping (Result<String, IntentHandlerError>) -> Void) {
        let message = Self.responses.randomElement()!

        completion(.success(message))
    }

}

extension HelloIntentHandler {

    private static var responses = [
        "Well hello there 👋🏻",
        "Hey there.",
        "Hello, pleased to meet you."
    ]

}
