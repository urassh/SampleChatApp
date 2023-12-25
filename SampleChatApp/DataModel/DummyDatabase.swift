//
//  Database.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import Foundation
import Combine

public enum DummyDatabase: Database {
    typealias Entity = Message
    private static let _messageSubject: CurrentValueSubject<[Message], Error> = .init([])
    
    static func entities() -> AnyPublisher<[Message], Error> {
        _messageSubject.eraseToAnyPublisher()
    }
    
    static func post(_ entity: Message, completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if Bool.random() {
                _messageSubject.value.append(entity)
                completion(.success(()))
            } else {
                completion(.failure(DummuError()))
            }
        }
    }
}
