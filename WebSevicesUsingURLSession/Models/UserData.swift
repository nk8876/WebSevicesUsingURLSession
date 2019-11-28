//
//  UserData.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 09/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import UIKit

struct UserInfo2:Decodable {
    
    var id : Int
    var name : String
    var username : String
    var email : String
    var phone : String
    var website : String
    var address : AddressData
    var company : CompanyData
}
struct AddressData:Decodable {
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : GeoData
}
struct GeoData:Decodable {
    var lat : String
    var lng : String
}
struct CompanyData:Decodable {
    var name : String
    var catchPhrase : String
    var bs : String

}
class JsonStruct: Decodable {
    var name:String
    var capital:String
    var alpha3Code:String
    var alpha2Code:String
    var region:String
    var subregion:String
} 
struct PostData:Decodable {
    var userId : String
    var id : Int
    var title : String
    var body : String
} 

