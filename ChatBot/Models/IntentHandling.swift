//
//  IntentHandling.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

protocol IntentHandling {

    func handle(utterance: String, completion: @escaping (Result<String, IntentHandlerError>) -> Void)

}
