

import UIKit

class __Exchange: NSObject {
    /// String 转化成CGFloat
    public class func __CGFloatFromString(_ str: String) -> (CGFloat){
        let string = str
        
        var cgFloat:CGFloat = 0
        if let doubleValue = Double(string){
            cgFloat = CGFloat(doubleValue)
        }
        
        return cgFloat
    }
    
    /// String 转化成Int
    public class func __IntFromString(_ str:String) -> (Int){
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
    
    /// String 转化成NSString
    public class func __NSStringFromString(_ str:String) -> (NSString){
        let toBeNSString: NSString = str as NSString
        return toBeNSString
    }
}
