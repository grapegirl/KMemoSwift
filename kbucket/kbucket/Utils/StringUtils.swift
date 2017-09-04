
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : StringUtils.swift
 * @Description : 스트링 유틸
 * @since 2017.09.04
 */
import Foundation

class StringUtils : NSObject{
    
    override init() {
       
    }
    
    //  /****
    //  * @Description : HTML 태그 변환된거 다시 변환하는 메소드
    //  * @Return 변환된 스트링 값
    //  */
    // public static String convertString(String str) {
    //     if (str.contains("&amp;")) {
    //         str = str.replace("&amp;", "&");
    //     }
    //     if (str.contains("&apos;")) {
    //         str = str.replace("&apos;", "'");
    //     }
    //     if (str.contains("&quot;")) {
    //         str = str.replace("&quot;", "\"");
    //     }
    //     if (str.contains("\\")) {
    //         str = str.replace("\\", "\\");
    //     }
    //     if (str.contains("&lt;")) {
    //         str = str.replace("&lt;", "<");
    //     }
    //     if (str.contains("&gt;")) {
    //         str = str.replace("&gt;", ">");
    //     }
    //     return str;
    // }

    // /***
    //  * 버전정보 비교 메소드
    //  *
    //  * @param srcVersion 버전
    //  * @param newVersion 서버에서 내려오는 버전
    //  * @return 버전 비교값(0이면 같음, 1이면 서버에서 내려오는 버전이 크다, -1이면 서버에서 이전버전이 내려옴)
    //  */
    // public static final int compareVersion(String srcVersion, String newVersion) {
    //     Integer[] arrSrc = getIntegrArrayFromStringArray(srcVersion.split("\\."));
    //     Integer[] arrNew = getIntegrArrayFromStringArray(newVersion.split("\\."));

    //     if (arrSrc.length != arrNew.length) {
    //         return 1;
    //     }

    //     for (int i = 0, n = arrSrc.length; i < n; i++) {
    //         if (arrNew[i] > arrSrc[i]) {
    //             return 1;
    //         } else if (arrNew[i] < arrSrc[i]) {
    //             return -1;
    //         }
    //     }
    //     return 0;

    // }

    // /***
    //  * String 배열을 integer 배열로 변환 메소드
    //  *
    //  * @param arr 변환할 String 배열
    //  * @return 변환된 integer 배열
    //  * @throws NumberFormatException
    //  */
    // public static final Integer[] getIntegrArrayFromStringArray(String[] arr) throws NumberFormatException {
    //     List<Integer> list = new ArrayList<Integer>();
    //     for (String str : arr) {
    //         list.add(Integer.parseInt(str));
    //     }
    //     return list.toArray(new Integer[list.size()]);
    // }


    // public static final String STRING_TIME_PATTERN = "yyyy-MM-dd";
    // public static final String STRING_DATETIME_PATTERN = "HH";
    // public static final String STRING_TIME_YYMMDD = "yy.MM.dd";
    // public static final String STRING_TIME_YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";

    // /**
    //  * 현재시간 패턴으로 가져오기
    //  *
    //  * @param pettern 패턴
    //  * @param time    현지시간 long
    //  * @return 현재시간
    //  */
    // public static String getTime(String pettern, String time) {
    //     long ltime = Long.parseLong(time);
    //     SimpleDateFormat format = new SimpleDateFormat(pettern);
    //     return format.format(new Date(ltime));
    // }

    // /**
    //  * 원하는 패턴으로 시간 변경하기
    //  *
    //  * @param time 시간 String(YYYY-MM-DD HH:mm:ss)형식
    //  * @return 현재시간
    //  */
    // public static String convertTime(String time) throws Exception {
    //     SimpleDateFormat sdt = new SimpleDateFormat(STRING_TIME_YYYYMMDDHHMMSS);
    //     try {
    //         Date date = (Date) sdt.parse(time);
    //         SimpleDateFormat format = new SimpleDateFormat(STRING_TIME_YYMMDD);
    //         return format.format(date);
    //     } catch (ParseException e) {
    //         return time;
    //     }

    // }

    // /**
    //  * 포스트 방식으로 데이타 전송시 인자 설정 메소드
    //  *
    //  * @param sendData
    //  * @return 포스트 방식 전송 데이타
    //  */
    // public static String getHTTPPostSendData(HashMap<String, Object> sendData) {
    //     StringBuilder sb = new StringBuilder();

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
    //     return sb.toString();
    // }

}
