//
//  ViewController.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 05/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrData = [JsonStruct]()
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.rowHeight = 100
          getData()
          downloadTableViewJsonData()
          self.setCustomeTitle()
          self.setCustomeImage()
    }
   
    func getData()
    {
        let url = ConstantAPIURL.shareInstance.getURL
        WebApiMethods.instance.resquestGetURL(strURL: url, parameters: ["" : ""]) { (data, error) in
            if error == nil {
                do{
                    let finalData = try JSONDecoder().decode(UserInfo2.self, from: data)
                    let address = finalData.address
                    print("Address Data:",address)
                    let geoData = address.geo
                    print("Geo Data:",geoData)
                    let comapnyData = finalData.company
                    print("Company Data:",comapnyData)
                    print(finalData)

                }catch{
                     print("\(error)")
            }
        }
    }
}
   
    func downloadTableViewJsonData(){
        let url = ConstantAPIURL.shareInstance.tableViewDataURL
        WebApiMethods.instance.resquestGetURL(strURL: url, parameters: ["":""]) { (data, error) in
            if error == nil{
                do{
                    self.arrData = try JSONDecoder().decode([JsonStruct].self, from: data)
                    for mainArr in self.arrData{
                        //print(mainArr.name ,":",mainArr.capital)
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                        }
                    }

                }catch{
                    print("\(error)")
                }
            }
        }
    }
  
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblName.text = "Name:\(arrData[indexPath.row].name)"
        cell.lblCapital.text = "Capital:\(arrData[indexPath.row].capital)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detail.strRegion = arrData[indexPath.row].region
        detail.strSubRegion = arrData[indexPath.row].subregion
        detail.strAlpha2 = arrData[indexPath.row].name
        detail.strAlpha3 = arrData[indexPath.row].capital
        self.navigationController?.pushViewController(detail, animated: true)
    }
}



