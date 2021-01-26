//
//  DismissKeyboardOnDragModifier.swift
//  ChatBot
//
//  Created by Adam Young on 25/01/2021.
//

import SwiftUI

struct DismissKeyboardOnDragModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .gesture(DragGesture().onChanged { _ in
                #if os(iOS)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                #endif
            })
    }

}

extension View {

    func dismissKeyboardOnDrag() -> some View {
        ModifiedContent(content: self, modifier: DismissKeyboardOnDragModifier())
    }

}
