//
//  TableViewCell.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 10/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
