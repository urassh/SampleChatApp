//
//  Sample.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import Foundation

struct Sample {
    static let user: User = .init(id: User.ID("urassh.1011@iclouc.com"), name: "urassh")
    static let user1: User = .init(id: User.ID("minorin.0226@iclouc.com"), name: "minorin")
    static let user2: User = .init(id: User.ID("wally.1011@iclouc.com"), name: "wally")
    
    static let message : Message = .init(user: Sample.user , text: "私の名前はうらっしゅ。仕事のできるメンターさ！", date: Date())
    static let message2: Message = .init(user: Sample.user1, text: "私の名前はみのりん。仕事のできるメンターさ！", date: Date())
    static let message3: Message = .init(user: Sample.user2, text: "私の名前はうぉーりー。仕事のできるメンターさ！", date: Date())
    static let message4: Message = .init(user: Sample.user , text: "私の名前はキノヤ。仕事のできるメンターさ！", date: Date())
    static let message5: Message = .init(user: Sample.user1, text: "私の名前はゆるゆる。仕事のできるメンターさ！", date: Date())
    static let message6: Message = .init(user: Sample.user2, text: "私の名前はたまちゃん。仕事のできるメンターさ！", date: Date())
    static let message7: Message = .init(user: Sample.user2, text: "私の名前はけーちゃん。仕事のできるメンターさ！", date: Date())
    static let message8: Message = .init(user: Sample.user2, text: "私の名前はらむーる。仕事のできるメンターさ！", date: Date())
    static let message9: Message = .init(user: Sample.user2, text: "私の名前はふじさん。仕事のできるメンターさ！", date: Date())
    static let message10: Message = .init(user: Sample.user2, text: "私の名前はダイキチ。仕事のできるメンターさ！", date: Date())
    static let message11: Message = .init(user: Sample.user2, text: "私の名前はことり。仕事のできるメンターさ！", date: Date())
    static let message12: Message = .init(user: Sample.user2, text: "私の名前はちゃんなーひー。仕事のできるメンターさ！", date: Date())
    static let message13: Message = .init(user: Sample.user2, text: "私の名前はダル。仕事のできるメンターさ！", date: Date())
    static let message14: Message = .init(user: Sample.user2, text: "私の名前はあいたん。仕事のできるメンターさ！", date: Date())
    
    static let messages: [Message] = [message, message2, message3, message4, message5, message6, message7, message8, message9, message10, message11, message12, message13, message14]
}
