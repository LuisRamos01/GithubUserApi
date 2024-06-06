//
//  listofUsers .swift
//  GithubUserApi
//
//  Created by Luis Eduardo Ramos on 14/03/2024.
//

import Foundation

typealias listOfUsers = [Users]

struct Users: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat, lng: String?
}

struct Company: Codable {
    let name, catchPhrase, bs: String?
}
