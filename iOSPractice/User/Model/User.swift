//
//  User.swift
//  iOSPractice
//
//  Created by Sang Choi on 11/15/20.
//

import Foundation

// https://jsonplaceholder.typicode.com/users

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
}

struct UserAddress: Codable {
    let street: String
    let city: String
    let zipcode: String
}
