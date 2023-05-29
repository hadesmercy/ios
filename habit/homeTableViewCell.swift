//
//  homeTableViewCell.swift
//  habit
//
//  Created by 魏一戈 on 2019/12/16.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var todayHabitAvator: UIImageView!
    
    @IBOutlet weak var todayHabitName: UILabel!
    
    @IBOutlet weak var todayHabitReminder: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
