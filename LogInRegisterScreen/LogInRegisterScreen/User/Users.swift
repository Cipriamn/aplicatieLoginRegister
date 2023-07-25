//
//  Users.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 25.07.2023.
//

import Foundation

struct User: Identifiable, Codable{
    var id: String
    let username:String
    var password:String
}
