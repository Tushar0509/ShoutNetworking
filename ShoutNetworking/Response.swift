//
//  Request.swift
//  ShoutNetworking
//
//  Created by Tushar Elangovan on 29/01/22.
//

import Foundation

struct UserResources: Decodable{
    var resource : UserResponse
}

struct UserResponse: Decodable{
    var resource: [UserDetails]
}

struct UserDetails: Decodable {
    var name: String
    var short_bio: String
    var interest: String
    var age: String
    var avatarmain: String 
}
