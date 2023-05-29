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
