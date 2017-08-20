
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : KLog.java
 * @Description : Log 클래스
 * @since 2017.08.20
 */
import Foundation

class KLog : NSObject{
    
    static var VIEW_LOG = true
    
    override init() {
       
    }
    
    static func setLogging(isDebugging : Bool) -> Void {
        VIEW_LOG = isDebugging;
    }

    static func d(tag : String, msg : String) -> Void {
        if (VIEW_LOG == true)
        {
            print(tag, " @@ "  + msg);
        }
    }
    

}
