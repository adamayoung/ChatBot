//
//  HackBot.swift
//  ChatBot
//
//  Created by Adam Young on 26/01/2021.
//

import CoreML
import Foundation
import NaturalLanguage

final class HackBot: Bot {

    init(name: String = "HackBot") {
        let mlModel = try! ChatBotTextClassifier(configuration: MLModelConfiguration()).model
        let nlModel = try! NLModel(mlModel: mlModel)

        super.init(name: name, nlModel: nlModel, handlerMap: [
            "greeting.hello": HelloIntentHandler(),
            "calendar.what-day": WhatDayIntentHandler(),
            "fact.chuck-norris": ChuckNorrisFactIntentHandler(),
            "absence.book-holiday": BookHolidayIntentHandler()
        ])
    }

}
