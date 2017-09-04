
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : DateUtils.swift
 * @Description : DateUtils 클래스
 * @since 2017.09.04
 */
import Foundation

class DateUtils : NSObject{
    
    override init() {
       
    }
    
    //  public static final String KBUCKET_MEMO_DATE_PATTER = "yyyy-MM-dd HH:mm:ss";
    //     public static final String KBUCKET_DB_DATE_PATTER = "yyyyMMddHHmmss";
    //     public static final String DATE_YYMMDD_PATTER = "yyyy-MM-dd";
    //     public static final String DATE_YYMMDD_PATTER2 = "yyyyMMdd";

    //     /**
    //      * 날짜 출력 포맷에 맞게 반환 메소드
    //      *
    //      * @param pattern 출력 패턴
    //      * @param date    날짜
    //      * @return 날자 출력 포맷에 맞는 문자열 반환
    //      */
    //     public static final String getStringDateFormat(String pattern, Date date) {
    //             SimpleDateFormat format = new SimpleDateFormat(pattern);
    //             return format.format(date);
    //     }

    //     /**
    //      * 날짜 형식에 맞게 날짜 변환후 비교
    //      *
    //      * @param pattern 날짜 형식
    //      * @param date1
    //      * @param date2
    //      * @return 0 같음, 1 date1이 date2보다 최신일, -1은date1이 date2 보다 과거
    //      */
    //     public static int getCompareDate(String pattern, String date1, String date2) {
    //             SimpleDateFormat format = new SimpleDateFormat(pattern);
    //             Date compareDay1 = null;
    //             Date compareDay2 = null;
    //             try {
    //                     compareDay1 = format.parse(date1);
    //                     compareDay2 = format.parse(date2);
    //             } catch (ParseException e) {
    //                     return -2;
    //             }

    //             int result = compareDay1.compareTo(compareDay2);
    //             return result;
    //     }

    //     /**
    //      * 패턴 형식으로 날짜 계산 후 형식에 맞는 날짜 반환하기
    //      *
    //      * @param pattern yyyyMMdd
    //      * @param day
    //      * @return
    //      */
    //     public static String getDateFormat(String pattern, int day) {
    //             Calendar calendar = Calendar.getInstance();
    //             calendar.add(Calendar.DATE, day);
    //             SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    //             return sdf.format(calendar.getTime());
    //     }


    //     /**
    //      * 현재시간 출력 메소드
    //      *
    //      * @return 시분초ms 까지 출력
    //      */
    //     public static String getCurrentTimeHHMMSSMS() {
    //             Calendar calendar = Calendar.getInstance();
    //             int hour = calendar.get(Calendar.HOUR);
    //             int minute = calendar.get(Calendar.MINUTE);
    //             int second = calendar.get(Calendar.SECOND);
    //             int misecond = calendar.get(Calendar.MILLISECOND);

    //             String time = hour + ":" + minute + ":" + second + ":" + misecond;
    //             return time;
    //     }

    //     /**
    //      * 현재시간 출력 메소드
    //      *
    //      * @return 시분초 까지 출력
    //      */
    //     public static String getCurrentTimeHHMMSS() {
    //             Calendar calendar = Calendar.getInstance();
    //             int hour = calendar.get(Calendar.HOUR_OF_DAY);
    //             int minute = calendar.get(Calendar.MINUTE);
    //             int second = calendar.get(Calendar.SECOND);

    //             String strHH = String.format("%02d", hour);
    //             String strMM = String.format("%02d", minute);
    //             String strSS = String.format("%02d", second);

    //             String time = strHH + "" + strMM + "" + strSS + "";
    //             return time;
    //     }
}
