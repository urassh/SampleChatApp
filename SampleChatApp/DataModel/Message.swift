//
//  Message.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//
import Foundation

struct Message: Identifiable {
    let id: ID = ID(uuid: UUID())
    var user: User
    var text: String
    var date: Date
    
    struct ID: Hashable {
        var uuid: UUID
        init(uuid: UUID = UUID()) {
            self.uuid = uuid
        }
    }
}
