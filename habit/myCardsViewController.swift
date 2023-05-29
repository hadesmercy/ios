import UIKit

class myCardsViewController: UIViewController{

    @IBOutlet weak var imgScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var screenBounds: CGRect = UIScreen.main.bounds
        let width = screenBounds.width
        //let height = screenBounds.height
        let imgHeight = 400
        let imgSpacing = 30
        let imgNumber = 2
        self.imgScrollView.contentSize = CGSize(width: width-40,height: CGFloat((imgHeight+imgSpacing)*imgNumber))
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
