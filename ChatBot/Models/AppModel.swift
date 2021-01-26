//
//  AppModel.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Combine
import Foundation

class AppModel: ObservableObject {

    let user: User
    let bots: [Bot]

    init(user: User, bots: [Bot] = []) {
        self.user = user
        self.bots = bots
    }

}

