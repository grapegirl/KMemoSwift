
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : UserDefault.swift
 * @Description : UserDefault 클래스
 * @since 2017.09.04
 */
import Foundation

class UserDefault : NSObject{
    
    override init() {
       
    }
    
   public static func write(key:String, value:String){
        var userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }

    public static func read(key:String) -> String {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let value = userDefaults.valueForKey(key) as? String {
            return value
        } else {
            return ""
        }
    }

    public static func delete(key:String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey(key)
    }
}
