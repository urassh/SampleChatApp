//
//  User.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

struct User {
    let id: ID
    var name: String
    
    struct ID: Hashable, ExpressibleByStringLiteral {
        let value: String
        init(_ value: String) {
            self.value = value
        }
        
        init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
    }
}
