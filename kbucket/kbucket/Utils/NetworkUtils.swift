
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : NetworkUtils.swift
 * @Description : 네트워크 연결 관련 유틸
 * @since 2017.09.04
 */
import Foundation

class NetworkUtils : NSObject{
    
    override init() {
       
    }
    
    // public static int TYPE_WIFI = 1;
    // public static int TYPE_MOBILE = 2;
    // public static int TYPE_NOT_CONNECTED = 0;


    // public static int getConnectivityStatus(Context context) {
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
    // }

    // public static boolean isConnectivityStatus(Context context) {
    //     ConnectivityManager cm = (ConnectivityManager) context
    //             .getSystemService(Context.CONNECTIVITY_SERVICE);

    //     NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
    //     if (null != activeNetwork) {
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_WIFI)
    //             return true;
    //         if (activeNetwork.getType() == ConnectivityManager.TYPE_MOBILE)
    //             return true;
    //     }
    //     return false;
    // }

}
