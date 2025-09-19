//
//  User.swift
//  todolist
//
//  Created by  Klaus Boger on 08/04/25.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
