//
//  UserResource.swift
//  iOSPractice
//
//  Created by Sang Choi on 11/15/20.
//

import Foundation

struct UserResource: APIResource {
    typealias ModelType = User
    let path = "https://jsonplaceholder.typicode.com/users"
    let queries: [URLQuery]? = [URLQuery(name: "sort", value: "ascending")] // optional
}
