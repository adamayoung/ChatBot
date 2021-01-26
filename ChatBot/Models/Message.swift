//
//  Message.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

struct Message: Identifiable {

    let id: UUID
    let user: User
    let text: String
    let date: Date

    init(id: UUID = .init(), user: User, text: String, date: Date = .init()) {
        self.id = id
        self.user = user
        self.text = text
        self.date = date
    }

}

extension Message {

    static var data: [Message] {
        let user = User(name: "Adam")
        let botUser = User(name: "Bot", isCurrent: false)

        return [
            Message(user: user, text: "Hello, what day is it?"),
            Message(user: botUser, text: "Today is Monday."),
            Message(user: user, text: "Thank you very much"),
            Message(user: botUser, text: "You're welcome.")
        ]
    }

}
