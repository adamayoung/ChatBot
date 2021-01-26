//
//  IntentHandlerError.swift
//  ChatBot
//
//  Created by Adam Young on 26/01/2021.
//

import Foundation

struct IntentHandlerError: LocalizedError {

    private let message: String

    init(message: String) {
        self.message = message
    }

    init(error: Error) {
        self.message = error.localizedDescription
    }

    var errorDescription: String? {
        message
    }

}
