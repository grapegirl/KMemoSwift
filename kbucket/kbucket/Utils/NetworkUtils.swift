
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : NetworkUtils.swift
 * @Description : 네트워크 연결 관련 유틸
 * @since 2017.09.04
 */

import Foundation
import SystemConfiguration

class NetworkUtils{
    
    init() {
    }

    public static let TYPE_WIFI : Int = 1
    public static let TYPE_MOBILE : Int = 2
    public static let TYPE_NOT_CONNECTED : Int = 0
    
    public static func getConnectivityStatus() -> Int {
        guard let status = Network.reachability?.status else { return TYPE_NOT_CONNECTED }
        print("Reachability Summary")
        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
        
        switch status {
        case .unreachable:
            return TYPE_NOT_CONNECTED
        case .wifi:
            return TYPE_WIFI
        case .wwan:
            return TYPE_MOBILE
            
        }
    }

    public static func isConnectivityStatus() -> Bool {
        guard let status = Network.reachability?.status else { return false }
        print("Reachability Summary")
        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
        
        switch status {
        case .unreachable:
            return false
        case .wifi:
            return true
        case .wwan:
            return true
         }
    }
}
