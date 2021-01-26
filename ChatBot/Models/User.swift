//
//  User.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import Foundation

struct User: Identifiable {

    let id: UUID
    let name: String
    let isCurrent: Bool

    init(id: UUID = .init(), name: String, isCurrent: Bool = true) {
        self.id = id
        self.name = name
        self.isCurrent = isCurrent
    }

}

extension User {

    static var dataUser: User {
        User(name: "Adam")
    }

    static var dataBotUser: User {
        User(name: "Bot", isCurrent: false)
    }

}
