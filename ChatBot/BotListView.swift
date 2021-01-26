//
//  BotListView.swift
//  ChatBot
//
//  Created by Adam Young on 26/01/2021.
//

import SwiftUI

struct BotListView: View {

    var bots: [Bot]
    var user: User

    var body: some View {
        List(bots) { bot in
            NavigationLink(destination: ChatView(bot: bot, user: user)) {
                Text(bot.botUser.name)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Bots")

    }
}

struct BotListView_Previews: PreviewProvider {

    static var previews: some View {
        BotListView(bots: [], user: User.dataUser)
    }

}
