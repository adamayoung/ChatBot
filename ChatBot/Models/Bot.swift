//
//  BotEngine.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Combine
import CoreML
import Foundation
import NaturalLanguage

class Bot: ObservableObject, Identifiable {

    var id: UUID {
        botUser.id
    }

    let botUser: User
    @Published private(set) var messages = [Message]()

    private let nlModel: NLModel
    private let handlerMap: [String: IntentHandling]
    private let minConfidenceThreshold: Double

    init(name: String, nlModel: NLModel, handlerMap: [String: IntentHandling], minConfidenceThreshold: Double = 0.4) {
        self.botUser = User(name: name, isCurrent: false)
        self.nlModel = nlModel
        self.handlerMap = handlerMap
        self.minConfidenceThreshold = minConfidenceThreshold
    }

    func greet() {
        respondWith("Hello there 👋🏻.\n\nAsk me what the day is, for a Chuck Norris fact or to book a holiday.")
    }

    func say(_ utterance: String, from user: User) {
        let message = Message(user: user, text: utterance)
        messages.append(message)

        let predictions = nlModel.predictedLabelHypotheses(for: utterance.lowercased(), maximumCount: 1)
        guard let (intent, confidence) = predictions.first, confidence > minConfidenceThreshold else {
            respondWith(Self.unknownResponses.randomElement()!)
            return
        }

        guard let handler = handlerMap[intent] else {
            respondWith(Self.unknownResponses.randomElement()!)
            return
        }

        handler.handle(utterance: utterance) { [weak self] result in
            switch result {
            case .success(let message):
                self?.respondWith(message)

            case .failure(let error):
                self?.respondWith(error.localizedDescription)
            }
        }
    }
    
}

extension Bot {

    private func respondWith(_ text: String) {
        let message = Message(user: botUser, text: text)
        DispatchQueue.main.async { [weak self] in
            self?.messages.append(message)
        }
    }

}

extension Bot {

    private static let unknownResponses = [
        "Sorry, I don't understand.",
        "I don't know that."
    ]

}
