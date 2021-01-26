//
//  ChatBotApp.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import SwiftUI

@main
struct ChatBotApp: App {

    @StateObject private var model = AppModel(
        user: User(name: "Adam"),
        bots: [
            HackBot(name: "HackDay Bot 1"),
            HackBot(name: "HackDay Bot 2")
        ]
    )

    var body: some Scene {
        WindowGroup {
            if model.bots.count == 1 {
                ChatView(bot: model.bots[0], user: model.user)
            } else {
                NavigationView {
                    BotListView(bots: model.bots, user: model.user)
                    Text("Choose a bot")
                }
            }
        }
    }

}
