//
//  User.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var name: String
    var lastName: String
    var picture: Data?
    var job: String
    var country: String
    
    static let emptyUser = User(name: "", lastName: "", job: "", country: "")
}
