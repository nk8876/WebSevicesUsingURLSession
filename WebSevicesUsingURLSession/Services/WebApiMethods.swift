//
//  HelperMethod.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 05/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
class WebApiMethods: NSObject {
    
    static let instance : WebApiMethods = WebApiMethods()
    
    //GET METHOD
    func resquestGetURL(strURL:String, parameters: [String: String], completionHandler: @escaping (_ data: Data , _ error: Error?) -> Void)  {
        
       
        let newURL = URL(string: strURL)
        let urlRequest = URLRequest(url: newURL!)
      
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // make the request
       
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            //print(data!)
            completionHandler(data!,error)
           }
        task.resume()
    }
    
     //POST METHOD
    func requestPostData(strURL:String, parameter:Data, completionHandler: @escaping (_ data:Data?, _ responce:HTTPURLResponse?, _ error: Error?) ->Void) {
        
        let newURL = URL(string: strURL)
        var urlRequest = URLRequest(url: newURL!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
       // guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else { return }
        urlRequest.httpBody = parameter
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //print(data!)
            completionHandler(data, response as? HTTPURLResponse,error)
        }
       task.resume()

    }
  
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
