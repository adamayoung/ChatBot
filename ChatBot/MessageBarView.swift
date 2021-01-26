//
//  MessageBarView.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import SwiftUI

struct MessageBarView: View {

    @Binding var text: String

    var send: () -> Void

    var body: some View {
        HStack {
            TextField("Type a message", text: $text, onCommit: send)
            Button(action: send) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title)
            }
            .disabled(text.isEmpty)
        }
    }

}

struct MessageBarView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            MessageBarView(text: .constant("A message"), send: {})
            MessageBarView(text: .constant(""), send: {})
        }
        .previewLayout(.sizeThatFits)
    }

}
