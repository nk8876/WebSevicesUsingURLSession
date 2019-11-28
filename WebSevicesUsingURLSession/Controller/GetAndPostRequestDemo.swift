//
//  GetAndPostRequestDemo.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 12/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class GetAndPostRequestDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setCustomeTitle()
        self.setCustomeImage()
    }
    

    @IBAction func onGetTappedAction(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return}
        let session = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let responce = responce
            {
                print(responce)
            }
            if let finalData = data
            {
                print(finalData)
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: finalData, options: []) 
                    print(jsonData)
                }catch{
                    print("Error is \(error)")
                }
            }
        }
        session.resume()
    }
    

    @IBAction func onPostTappedAction(_ sender: UIButton) {
        let parameters = ["username":"naresh","tweet":"hello world"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared.dataTask(with: request) { (data, responce, error) in
            if let responce = responce
            {
                print(responce)
            }
            if let finalData = data
            {
                print(finalData)
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: finalData, options: [])
                    print(jsonData)
                }catch{
                    print("Error is \(error)")
                }
            }
        }
        session.resume()
    }
}

