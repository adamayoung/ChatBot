//
//  BookHolidayIntentHandler.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

final class BookHolidayIntentHandler: IntentHandling {

    func handle(utterance: String, completion: @escaping (Result<String, IntentHandlerError>) -> Void) {
        let date = findDates(in: utterance).first ?? Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        let message = String(format: Self.responses.randomElement()!, dateFormatter.string(from: date))

        completion(.success(message))
    }

}

extension BookHolidayIntentHandler {

    private func findDates(in utterance: String) -> [Date] {
        let detectorType: NSTextCheckingResult.CheckingType = [.date]
        guard let detector = try? NSDataDetector(types: detectorType.rawValue) else {
            return []
        }

        let results = detector.matches(in: utterance, options: [], range: NSRange(0..<utterance.count))
        return results.compactMap { content in
            switch content.resultType {
            case NSTextCheckingResult.CheckingType.date:
                return content.date!

            default:
                return nil
            }
        }
    }

}

extension BookHolidayIntentHandler {

    private static var responses = [
        "Your holiday has been booked for %@.",
        "All done. Holiday booked for %@.",
        "Sorted. Holiday has been booked for %@."
    ]

}
