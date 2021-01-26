//
//  ContentView.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import SwiftUI

struct ChatView: View {

    @ObservedObject var bot: Bot
    var user: User

    @State private var text = ""

    var body: some View {
        VStack {
            List(bot.messages.reversed()) { message in
                MessageBubbleView(message: message)
                    .scaleEffect(x: 1, y: -1, anchor: .center)
            }
            .listStyle(PlainListStyle())
            .dismissKeyboardOnDrag()
            .scaleEffect(x: 1, y: -1, anchor: .center)
            .offset(x: 0, y: 2)

            MessageBarView(text: $text, send: send)
                .padding()
        }
        .navigationTitle(bot.botUser.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if bot.messages.isEmpty {
                bot.greet()
            }
        }
    }

    private func send() {
        bot.say(text, from: user)
        text = ""
    }

}

struct ChatView_Previews: PreviewProvider {

    static var previews: some View {
        ChatView(bot: HackBot(), user: User(name: "Preview"))
    }

}
