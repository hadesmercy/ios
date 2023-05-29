//
//  allhabitsTableViewCell.swift
//  habit
//
//  Created by 魏一戈 on 2019/12/16.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class allhabitsTableViewCell: UITableViewCell {

    @IBOutlet weak var NameOfHabit: UILabel!
    @IBOutlet weak var FlagOfHabit: UILabel!
    @IBOutlet weak var times: UILabel!
    @IBOutlet weak var imageOfHabit: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
