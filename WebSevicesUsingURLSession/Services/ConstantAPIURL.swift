//
//  ConstantAPIURL.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 05/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
struct ConstantAPIURL {
    static let shareInstance : ConstantAPIURL = ConstantAPIURL()
    var postURL = "https://jsonplaceholder.typicode.com/posts"
    var getURL = "http://jsonplaceholder.typicode.com/users/2"
    var tableViewDataURL = "https://restcountries.eu/rest/v2/all"

    var deleteURL = ""
    var updateURL = ""

}

