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
