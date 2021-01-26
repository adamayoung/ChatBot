//
//  MessageBubbleView.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import SwiftUI

struct MessageBubbleView: View {

    var message: Message

    var background: some View {
        if message.user.isCurrent {
            return Color.accentColor
        } else {
            return Color.secondary.opacity(0.25)
        }
    }

    var title: some View {
        if message.user.isCurrent {
            return Text("")
        } else {
            return Text(message.user.name)
                .font(.footnote)
        }
    }

    var body: some View {
        HStack {
            if message.user.isCurrent {
                Spacer()
            }

            VStack(alignment: .leading) {
                Text(message.text)
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing])
                    .background(background)
                    .cornerRadius(10)
                title
            }

            if !message.user.isCurrent {
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }

}

struct MessageBubbleView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            MessageBubbleView(message: Message.data[0])
            MessageBubbleView(message: Message.data[1])
        }
        .previewLayout(.sizeThatFits)
    }

}
