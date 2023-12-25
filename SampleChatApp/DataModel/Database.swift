//
//  Database.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/20.
//
import Combine

protocol Database {
    associatedtype Entity
    static func entities() -> AnyPublisher<[Entity], Error>
    static func post(_ entity: Entity, completion: @escaping (Result<Void, Error>) -> Void)
}
