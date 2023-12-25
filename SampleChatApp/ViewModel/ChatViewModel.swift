//
//  ChatViewModel.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import Foundation
import Combine

final class ChatViewModel<T: Database>: ObservableObject {
    @Published var messages: [Message] = []
    @Published var hasWriteError: Bool = false
    private var isActivate: Bool = false
    private var cancellable: Set<AnyCancellable> = []
    
    func postMessage(_ message: Message, completion: @escaping (Result<Void, Error>) -> Void) {
        T.post(message as! T.Entity) { result in
            do {
                try result.get()
                self.hasWriteError = false
            } catch {
                self.hasWriteError = true
            }
            
            completion(result)
        }
    }
    
    func activate() {
        if isActivate { return }
        
        isActivate = true
        T.entities().sink(receiveCompletion: { _ in
            //TODO
        }, receiveValue: { messages in
            self.messages = messages as! [Message]
        })
        .store(in: &cancellable)
    }
    
    func deactivate() {
        guard isActivate else { return }
        cancellable.removeAll()
    }
}

struct DummuError: Error {
    
}
