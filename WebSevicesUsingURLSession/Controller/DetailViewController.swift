//
//  DetailViewController.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 10/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var alpha2: UILabel!
    @IBOutlet weak var alpha3: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subRegion: UILabel!
    
    var strAlpha2 = ""
    var strAlpha3 = ""
    var strRegion = ""
    var strSubRegion = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        alpha2.text! = strAlpha2
        alpha3.text! = strAlpha3
        region.text! =  strRegion
        subRegion.text! = strSubRegion
        self.setCustomeTitle()
        self.setCustomeImage()
    }
    

    @IBAction func onTappedPostAction(_ sender: UIButton) {
        let parameters = [
            "userId":"100",
            "id": 5,
            "title":"Decoding stuff",
            "body":"This is decoding session"
            
            ] as [String : Any]
        guard let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {
            return
        }
        print(bodyData)
        let url = ConstantAPIURL.shareInstance.postURL
        WebApiMethods.instance.requestPostData(strURL: url,parameter:bodyData ) { (data, responce, error) in
            guard let data1 = data else{ return  }
            print(data1)
            print(responce ?? "")
           do{
            let sentPost = try JSONDecoder().decode(PostData.self, from: data1)
                print(sentPost)
                // let jsonData = try JSONSerialization.jsonObject(with: data1, options: [])
                // print(jsonData)
            }
            catch{
                print(error)
            }
        }
    }
  
}
