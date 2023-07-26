//
//  Users.swift
//  LogInRegisterScreen
//
//  Created by Nitipir Cornelia on 25.07.2023.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let email:String
    var fullName:String
    var initials:String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, email: "test@gmail.com", fullName: "James Lerown")
    
}
