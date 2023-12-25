//
//  ChatView.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    let messages: [Message]
    let hasWriteError: Bool
    
    let postMessage: (Message, @escaping (Result<Void, Error>) -> Void) -> Void
    
    @Namespace private var bottomID
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading,spacing: 0) {
                        ForEach(messages) { message in
                            MessageView(message: message)
                                .padding()
                            Divider()
                        }
                        
                        Divider()
                            .id(bottomID)
                    }
                }
                
                Divider()
                   
                VStack(alignment: .leading) {
                    if hasWriteError {
                        Text("投稿に失敗しました")
                            .foregroundStyle(.red)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        TextField("", text: $messageText)
                            .textFieldStyle(.roundedBorder)
                        
                        Button(action: {
                            let message = Message(user: Sample.user, text: messageText, date: Date())
                            
                            postMessage(message) { result in
                                do {
                                    try result.get()
                                    messageText = ""
                                    DispatchQueue.main.async {
                                        proxy.scrollTo(bottomID)
                                    }
                                } catch {
                                    messageText = message.text
                                }
                            }
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview("case post success") {
    ChatView(messages: Sample.messages, hasWriteError: false) { _ ,_  in
        
    }
}

#Preview("case post failed") {
    ChatView(messages: Sample.messages, hasWriteError: true) { _ ,_  in
        
    }
}


