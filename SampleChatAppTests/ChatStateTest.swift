//
//  ChatStateTest.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/20.
//

import XCTest
@testable import SampleChatApp
import Combine

final class ChatStateTest: XCTestCase {
    func testPostMessage() {
        let state: ChatViewModel<TestDatabase> = .init()
        
        ///TEST: 投稿失敗のテスト
        state.postMessage(Sample.message) { result in
            do {
                try result.get()
                XCTFail()
            } catch {
            }
        }
        TestDatabase.postMessageCompletion?(.failure(TestError()))
        XCTAssertTrue(state.hasWriteError)
        
        ///TEST: 投稿成功のテスト
        state.postMessage(Sample.message) { result in
            do {
                try result.get()
            } catch {
                XCTFail()
            }
        }
        TestDatabase.postMessageCompletion?(.success(()))
        XCTAssertFalse(state.hasWriteError)
    }
}

private enum TestDatabase: Database {
    typealias Entity = Message
    static var postedMessages: [Message] = []

    
    static func entities() -> AnyPublisher<[Message], Error> {
        fatalError()
    }
    
    static func post(_ entity: Message, completion: @escaping (Result<Void, Error>) -> Void) {
        postMessageCompletion = completion
    }
    
    static var postMessageCompletion: ((Result<Void, Error>) -> Void)?
}


struct TestError: Error {
    
}
