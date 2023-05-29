import UIKit

class optionsTableViewCell: UITableViewCell {

    @IBOutlet weak var NameOfOptions: UILabel!
    @IBOutlet weak var imageOfOptions: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
