
/***
 * @author grapegirl
 * @version 1.0
 * @Class Name : ViewUtils.swift
 * @Description : Log 클래스
 * @since 2017.12.04
 */
import UIKit

class ViewUtils {
    
    private let TAG : String = "ViewUtils"

    init() {
    }
    
    public static func changeView(strView : String){
        KLog.d(tag: TAG, msg: "changeView : " + strView)
        let uvc = self.storyboard?.instantiateViewController(withIdentifier : strView)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    public static func finish(){
        KLog.d(tag: TAG, msg: "finish")
        self.dismiss(animated: true, completion : nil)
    }    
}
