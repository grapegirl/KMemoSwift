
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : NetworkUtils.swift
 * @Description : 네트워크 연결 관련 유틸
 * @since 2017.09.04
 */

class NetworkUtils{
    
    init() {
       
    }

    public static let TYPE_WIFI : Int = 1
    public static let TYPE_MOBILE : Int = 2
    public static let TYPE_NOT_CONNECTED : Int = 0
    
    public static func getConnectivityStatus() -> Void {
    //     ConnectivityManager cm = (ConnectivityManager) context
    //             .getSystemService(Context.CONNECTIVITY_SERVICE);

    //     NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
    //     if (null != activeNetwork) {
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_WIFI)
    //             return TYPE_WIFI;
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_MOBILE)
    //             return TYPE_MOBILE;
    //     }
    //     return TYPE_NOT_CONNECTED;
    }

    public static func isConnectivityStatus() -> Bool {
    //     ConnectivityManager cm = (ConnectivityManager) context
    //             .getSystemService(Context.CONNECTIVITY_SERVICE);

    //     NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
    //     if (null != activeNetwork) {
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_WIFI)
    //             return true;
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_MOBILE)
    //             return true;
    //     }
        return false;
    }

}
