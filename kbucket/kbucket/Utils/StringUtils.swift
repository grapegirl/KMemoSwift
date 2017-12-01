
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : StringUtils.swift
 * @Description : 스트링 유틸
 * @since 2017.09.04
 */
import Foundation

extension String {

    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
}

class StringUtils   {
    
    init() {
       
    }

    public static let STRING_TIME_PATTERN : String = "yyyy-MM-dd"
    public static let STRING_DATETIME_PATTERN : String = "HH"
    public static let STRING_TIME_YYMMDD : String = "yy.MM.dd"
    public static let STRING_TIME_YYYYMMDDHHMMSS : String = "yyyy-MM-dd HH:mm:ss"

    public static func contains(strOrigin : String, find : String )-> Bool {
        if strOrigin.range(of:find) != nil { 
            return true
        }
        return false
    }
    
    /****
     * @Description : HTML 태그 변환된거 다시 변환하는 메소드
     * @Return 변환된 스트링 값
     */
    public static func convertString(str : String)-> String{
        var temp = str
       if (contains(strOrigin: temp, find : "&amp;")) {
           temp = str.replace(target:"&amp;",withString : "&");
       }
       if (contains(strOrigin: temp, find : "&apos;")) {
           temp = str.replace(target:"&apos;",withString : "'");
       }
       if (contains(strOrigin: temp, find : "&quot;")) {
           temp = str.replace(target:"&quot;",withString : "\"");
       }
       if (contains(strOrigin: temp, find : "\\")) {
           temp = str.replace(target:"\\",withString : "\\");
       }
       if (contains(strOrigin: temp, find : "&lt;")) {
           temp = str.replace(target:"&lt;",withString : "<");
       }
       if (contains(strOrigin: temp, find : "&gt;")) {
           temp = str.replace(target:"&gt;",withString : ">");
       }
        return temp;
    }
     
    /***
     * 버전정보 비교 메소드
     *
     * @param srcVersion 버전
     * @param newVersion 서버에서 내려오는 버전
     * @return 버전 비교값(0이면 같음, 1이면 서버에서 내려오는 버전이 크다, -1이면 서버에서 이전버전이 내려옴)
     */
     public static func compareVersion(srcVersion : String, newVersion : String ) -> Int {
        var arrSrc: ArrayList<Int> = getIntegrArrayFromStringArray(srcVersion.components(separatedBy: "\\."))
        var arrNew: ArrayList<Int> = getIntegrArrayFromStringArray(newVersion.components(separatedBy: "\\."))

        if (arrSrc.count != arrNew.count) {
            return 1;
        }

        for (int i = 0, n = arrSrc.count; i < n; i++) {
            if (arrNew[i] > arrSrc[i]) {
                return 1;
            } else if (arrNew[i] < arrSrc[i]) {
                return -1;
            }
        }
        return 0;
    }

    /***
     * String 배열을 integer 배열로 변환 메소드
     *
     * @param arr 변환할 String 배열
     * @return 변환된 integer 배열
     * @throws NumberFormatException
     */
     public static func getIntegrArrayFromStringArray(arr : ArrayList<String>) -> ArrayList<Int> {
        var list = ArrayList<Int>()
        for (String str : arr) {
            list.append(Int(str))
        }
        return list
    }


     /**
     * 포스트 방식으로 데이타 전송시 인자 설정 메소드
     *
     * @param sendData
     * @return 포스트 방식 전송 데이타
     */
     public static func getHTTPPostSendData(sendData : String) -> String {
    // public static String getHTTPPostSendData(HashMap<String, Object> sendData) {
        var sb = sendData

    //     //키값과 값을 추가함.
    //     Set<String> key = sendData.keySet();
    //     for (Iterator iterator = key.iterator(); iterator.hasNext(); ) {
    //         String keyName = (String) iterator.next();
    //         Object value = (Object) sendData.get(keyName);

    //         if (iterator.hasNext())
    //             sb.append(keyName).append("=").append(value).append("&");
    //         else
    //             sb.append(keyName).append("=").append(value);
    //     }
    //     //System.out.println("@@ getHTTPPostSendData :  " + sb.toString());
        return sb
    }

}
