

import UIKit

class __Exchange: NSObject {
    
    // String 转化成CGFloat
    public class func CGFloatFromString(_ str: String) -> (CGFloat){
        let string = str
        
        var cgFloat:CGFloat = 0
        if let doubleValue = Double(string){
            cgFloat = CGFloat(doubleValue)
        }
        
        return cgFloat
    }
    
    public class func IntFromString(_ str:String) -> (Int){
        let string = str
        
        var int:Int?
        if let doubleValue = Int(string) {
            int = Int(doubleValue)
        }
        
        if int == nil{
            return 0
        }
        
        return int!
    }
    
}
