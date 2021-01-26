//
//  BotEngine.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import CoreML
import Foundation
import NaturalLanguage

final class Bot {

    private static let minConfidenceThreshold = 0.4

    private lazy var intentPredictor: NLModel = {
        let mlModel = try! ChatBotTextClassifier(configuration: MLModelConfiguration()).model
        return try! NLModel(mlModel: mlModel)
    }()

    func respondTo(_ utterance: String, completion: @escaping (String) -> Void) {
        let predictions = intentPredictor.predictedLabelHypotheses(for: utterance.lowercased(), maximumCount: 1)
        guard let (intent, confidence) = predictions.first, confidence > Self.minConfidenceThreshold else {
            completion(Self.unknownResponses.randomElement()!)
            return
        }

        guard let handler = intentHandler(for: intent) else {
            completion(Self.unknownResponses.randomElement()!)
            return
        }

        handler.handle(utterance: utterance) { result in
            switch result {
            case .success(let message):
                completion(message)

            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
    
}

extension Bot {

    private func intentHandler(for intent: String) -> IntentHandling? {
        Self.intentHandlers[intent]
    }

}

extension Bot {

    private static let intentHandlers: [String: IntentHandling] = [
        "greeting.hello": HelloIntentHandler(),
        "calendar.what-day": WhatDayIntentHandler(),
        "fact.chuck-norris": ChuckNorrisFactIntentHandler(),
        "absence.book-holiday": BookHolidayIntentHandler()
    ]

    private static let unknownResponses = [
        "Sorry, I don't understand.",
        "I don't know that."
    ]

}
