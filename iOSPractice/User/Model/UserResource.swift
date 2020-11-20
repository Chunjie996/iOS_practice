//
//  UserResource.swift
//  iOSPractice
//
//  Created by Sang Choi on 11/15/20.
//

import Foundation

struct UserResource: APIResource {
    typealias ModelType = User
    let basePath = "https://jsonplaceholder.typicode.com/users"
//    let identifier: String? // optional
//    let queries: [URLQuery]? = [URLQuery(name: "sort", value: "ascending")] // optional
//    let payload: User? // optional
}
