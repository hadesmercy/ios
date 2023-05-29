
//和更新日期有关的类
import Foundation

class lastUpDateClass:NSObject, NSCoding{
   var lUdate = Date(timeIntervalSince1970: 0)
    override init(){
        self.lUdate = Date()
    }
    func setDate(){
        self.lUdate = Date()
    }
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("lastUpDateClass")
       
       func encode(with aCoder: NSCoder) {
              //aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(lUdate,forKey: "lUdate")
          }
       required init?(coder aDecoder: NSCoder){
          // name = aDecoder.decodeObject(forKey: "nameKey") as? String
        lUdate = aDecoder.decodeObject(forKey: "lUdate") as! Date
       }
    func getDate()->Date{
        return lUdate
    }
}

