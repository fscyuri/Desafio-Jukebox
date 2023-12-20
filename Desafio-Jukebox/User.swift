//
//  User.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

class User {
    let id: Int
    var name: String
    var credits: Float
    var age: Int?
    
    init(id: Int, name: String, credits: Float, age: Int? = nil) {
        self.id = id
        self.name = name
        self.credits = credits
        self.age = age
    }
}
