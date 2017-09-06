
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : AppUtils.swift
 * @Description : Log 클래스
 * @since 2017.09.04
 */

class AppUtils {
    
    private let TAG : String = "AppUtils"

    init() {
       
    }
    
     /**
     * 사용자 정보 출력 메소드
     *
     * @param context 컨텍스트
     */
     public static func printUserPhoneInfo() -> Void {
        // Locale locale = context.getResources().getConfiguration().locale;
        // String displayCountry = locale.getDisplayCountry();
        // String country = locale.getCountry();
        // String launage = locale.getLanguage();

        // KLog.d(tag: TAG, msg: "displayCountry => "+displayCountry);
        // KLog.d(tag: TAG, msg: "County => " + country);
        // KLog.d(tag: TAG, msg: " launage => " + launage);
     }
    
    /**
     * 현재 사용자에 설정된 언어 가져오기
     *
     * @param context 컨텍스트
     * @return 언어 정보
     */
     public static func getUserPhoneLanuage() -> Void {
        //  Locale locale = context.getResources().getConfiguration().locale;
        // return locale.getLanguage();
     }

    /**
     * 현재 사용자에 설정된 국가 정보 가져오기
     *
     * @param context 컨텍스트
     * @return 국가 정보
     */
     public static func getUserPhoneCoutry() -> Void {
         //     Locale locale = context.getResources().getConfiguration().locale;
        //     return locale.getCountry();
     }

    /***
     * 타임존 시간 출력 메소드
     */
     public static func printUserPoneTimezone() -> Void {
    //     TimeZone tz;
        //     Date date = new Date();
        //     DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss (z Z)");

        //     tz = TimeZone.getTimeZone("Asia/Seoul");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));


        //     tz = TimeZone.getTimeZone("Greenwich");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));


        //     tz = TimeZone.getTimeZone("America/Los_Angeles");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));


        //     tz = TimeZone.getTimeZone("America/New_York");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));


        //     tz = TimeZone.getTimeZone("Pacific/Honolulu");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));


        //     tz = TimeZone.getTimeZone("Asia/Shanghai");
        //     df.setTimeZone(tz);
        //     //System.out.println("@@ timezone : " + tz.getDisplayName() + "," + df.format(date));
     }

    /**
     * 언어 설정 메소드
     *
     * @param context 컨텍스트
     * @param locale  국가
     */
     public static func setLocale() -> Void {
        //     Locale.setDefault(locale);
        //     Configuration configuration = new Configuration();
        //     configuration.locale = locale;
        //     context.getResources().updateConfiguration(configuration, context.getResources().getDisplayMetrics());
     }
    

    /**
     * 현재 사용자에 설정된 시간정보 가져오기
     *
     * @return 시간 정보
     */
     public static func getUserPhoneTimezone() -> Void {
         //     TimeZone timeZone = TimeZone.getDefault();
        //     timeZone = timeZone.getTimeZone(timeZone.getID());
        //     Date date = new Date();
        //     DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //     df.setTimeZone(timeZone);
        //     return df.format(date);
     }

    
    
    /**
     * 사용자 Device ID 반환 메소드
     *
     * @return 사용자 Device ID
     */
     public static func getUserDeviceID() -> Void {
        //     TelephonyManager telephony = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        //     String deviceId = telephony.getDeviceId();
        //     return deviceId;
     }
    

    /**
     * 서비스가 실행중인지 반환하는 메소드
     *
     * @param context     컨텍스트
     * @param serviceName 서비스명
     * @return 실행중이면 true, 아니면 false
     */
     public static func getRunningService(serviceName : String) -> Void {
       //     ActivityManager manager = (ActivityManager) context.getSystemService(Activity.ACTIVITY_SERVICE);
    //     for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
    //         if (serviceName.equals(service.service.getClassName())) {
    //             return true;
    //         }
    //     }
    //     return false;
    }

    /**
     * 앱 버전 코드 반환 메소드
     *
     * @param context 컨텍스트
     * @return 앱 버전(int형) 예외상황 -1값 반환
     */
    public static func getVersionCode() -> Void {
        // PackageManager packageManager = context.getPackageManager();
        // String pkgName = context.getPackageName();
        // int versionCode;
        // try {
        //     PackageInfo packageInfo = (PackageInfo) packageManager.getPackageInfo(pkgName, 0);
        //     versionCode = packageInfo.versionCode;
        // } catch (PackageManager.NameNotFoundException e) {
        //     versionCode = -1;
        // }
        // return versionCode;
    }

    /**
     * 앱 버전 네임 반환 메소드
     *
     * @param context 컨텍스트
     * @return 앱 버전 네임(string형) 예외상황 null 반환
     */
    public static func getVersionName() -> Void {
        // PackageManager packageManager = context.getPackageManager();
        // String pkgName = context.getPackageName();
        // String versionName;
        // try {
        //     PackageInfo packageInfo = (PackageInfo) packageManager.getPackageInfo(pkgName, 0);
        //     versionName = packageInfo.versionName;
        // } catch (PackageManager.NameNotFoundException e) {
        //     versionName = null;
        // }
        // return versionName;
    }


    /**
     * 패키지명으로 실행중인 앱 여부 반환 메소드
     *
     * @param context  컨텍스트
     * @param packName 패키지명
     * @return 실행 여부(true - 실행중, false - 실행안됨)
     */
    public static func getServiceTaskName(packName : String) -> Void {
    //     boolean checked = false;
    //     ActivityManager am = (ActivityManager) context.getSystemService(context.ACTIVITY_SERVICE);
    //     List<ActivityManager.RunningAppProcessInfo> list = am.getRunningAppProcesses();
    //     for (ActivityManager.RunningAppProcessInfo rap : list) {
    //         if (rap.processName.equals(packName)) {
    //             return true;
    //         }
    //     }
    //     return false;
    }


    /**
     * 패키지로 앱 설치 유무 반환 메소드
     *
     * @param packageName 패키지명
     * @return 앱 설치 유무
     */
    public static func checkAppPakcage(packName : String) -> Void {
        // try {
        //     PackageManager pm = context.getPackageManager();
        //     PackageInfo pi = pm.getPackageInfo(packageName, PackageManager.GET_META_DATA);
        //     ApplicationInfo appInfo = pi.applicationInfo;
        // } catch (PackageManager.NameNotFoundException e) {
        //     // 패키지가 없을 경우.
        //     return false;
        // }
        // return true;
    }

    /**
     * 마켓 이동 메소드
     *
     * @param context      컨텍스트
     * @param packangeName 마켓 이동할 패키지명
     */
    public static func locationMarket(packName : String) -> Void {
        // Intent intent = new Intent(Intent.ACTION_VIEW);
        // intent.setData(Uri.parse("market://details?id=" + packangeName));
        // context.startActivity(intent);
    }
  }
