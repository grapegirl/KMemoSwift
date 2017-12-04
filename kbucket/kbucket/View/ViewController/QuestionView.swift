//
//  QuestionView.swift
//  문의하기
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class QuestionView: UIViewController {

    private let TAG : String = "QuestionView"
    private var mTitleIndex : Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }
    

    private func initialize(){
            setTitleIndex(index: 1)
    //     findViewById(R.id.question_layout_titleView1).setOnClickListener(this);
    //     findViewById(R.id.question_layout_titleView2).setOnClickListener(this);
    //     findViewById(R.id.question_layout_titleView3).setOnClickListener(this);
    //     findViewById(R.id.question_layout_button).setOnClickListener(this);
    //     AppUtils.sendTrackerScreen(this, "문의화면");
     }
    
    private func finish(){
        KLog.d(tag: TAG, msg: "finish")
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    @IBAction func onClick(_ sender: Any) {
          switch(sender  as! UIButton ){
    //         // 보내기 버튼
    //         case R.id.question_layout_button:
    //             String title = getTitleIndex(mTitleIndex);
    //             String content = ((EditText) findViewById(R.id.question_layout_contentView)).getText().toString();
    //             sendEmail(title, content);
    //             finish();
    //             break;
    //         case R.id.question_layout_titleView1:
    //             setTitleIndex(1);
    //             break;
    //         case R.id.question_layout_titleView2:
    //             setTitleIndex(2);
    //             break;
    //         case R.id.question_layout_titleView3:
    //             setTitleIndex(3);
    //             break;
            default:
            break;
          }
    }
  
    /***
     * 메일 보내기
     *
     * @param name    제목
     * @param content 내용
     */
     private func sendEmail(name :String, content : String){
    //     Intent it = new Intent(Intent.ACTION_SEND);
    //     it.setType("plain/text");
    //     String[] tos = {"kikiplus2030@naver.com"};
    //     it.putExtra(Intent.EXTRA_EMAIL, tos);
    //     it.putExtra(Intent.EXTRA_SUBJECT, name);
    //     it.putExtra(Intent.EXTRA_TEXT, content);
    //     startActivity(it);
     }

    private func setTitleIndex(index : Int){
       //mTitleIndex = index
        switch (index) {
            case 1:
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.WHITE);
                break;
            case 2:
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.WHITE);
                break;
            case 3:
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.WHITE);
                break;
                default:
                break;
        }
    }

    private func getTitleIndex(index : Int) -> String {
        switch (index) {
            case 1:
                return "오류"
            case 2:
                return "개선"
            case 3:
                return "문의"
            default:
                return "기타"
        }
    }
}
