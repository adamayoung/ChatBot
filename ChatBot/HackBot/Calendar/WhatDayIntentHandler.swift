//
//  WhatDayIntentHandler.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

final class WhatDayIntentHandler: IntentHandling {

    func handle(utterance: String, completion: @escaping (Result<String, IntentHandlerError>) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: Date())

        let message = String(format: Self.responses.randomElement()!, day)

        completion(.success(message))
    }

}

extension WhatDayIntentHandler {

    private static var responses = [
        "Today is %@.",
        "The day is %@.",
        "It's %@."
    ]

}
