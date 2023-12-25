//
//  ChatStateView.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import SwiftUI

struct ChatStateView: View {
    @StateObject private var state: ChatViewModel<DummyDatabase> = .init()
    
    var body: some View {
        ChatView(messages: state.messages, hasWriteError: state.hasWriteError, postMessage: state.postMessage(_:completion:))
            .onAppear    { state.activate()   }
            .onDisappear { state.deactivate() }
    }
}

#Preview {
    ChatStateView()
}
