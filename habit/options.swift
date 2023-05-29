import Foundation
import UIKit
class options: NSObject {
    var optionsName: String?
    var optionsAvator: UIImage?
    var targetStoryboard: String!
    
    init(name: String?, img: UIImage?, target: String!){
        self.optionsName = name
        self.optionsAvator = img
        self.targetStoryboard = target
    }

//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(optionsName, forKey: "nameKey")
//    }
//    required init?(coder aDecoder: NSCoder) {
//        optionsName = aDecoder.decodeObject(forKey: "nameKey") as? String
//    }
}
