
/***
 * @author grapegirl
 * @version 1.1
 * @Class Name : ScreenUtils.swift
 * @Description : 화면 유틸 클래스
 * @since 2017.09.04
 */

class ScreenUtils{
    
     init() {
       
    }
    
    public static func dpToPx(dp : Int) -> Int {
    //     return (int) (dp * Resources.getSystem().getDisplayMetrics().density);
        return 0
    }

    public static func pxToDp(dp : Int) -> Int {
    // public static int pxToDp(int px) {
    //     return (int) (px * Resources.getSystem().getDisplayMetrics().density);
        return 0
    }


    /**
     * 해상도 pixel 가져오는 메소드
     *
     * @param windowManager
     * @return 화면 해상도 가로 세로
     */
    public static func getDisplay() -> String {
    //     DisplayMetrics metrics = new DisplayMetrics();
    //     windowManager.getDefaultDisplay().getMetrics(metrics);
    //     int ScreenWidth = metrics.widthPixels;
    //     int ScreenHeight = metrics.heightPixels;
    //     String displayInfo = ScreenWidth + "," + ScreenHeight;
    //     return displayInfo;
        return ""
    }

}
