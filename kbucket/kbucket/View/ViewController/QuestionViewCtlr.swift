//
//  QuestionViewCtlr.swift
//  문의하기
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class QuestionViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "QuestionViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private int mTitleIndex = 1;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.question_activity);
    //     setBackgroundColor();
    //     setTextFont();
    //     setTitleIndex(1);
    //     findViewById(R.id.question_layout_titleView1).setOnClickListener(this);
    //     findViewById(R.id.question_layout_titleView2).setOnClickListener(this);
    //     findViewById(R.id.question_layout_titleView3).setOnClickListener(this);
    //     findViewById(R.id.question_layout_button).setOnClickListener(this);
    //     AppUtils.sendTrackerScreen(this, "문의화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.question_back_color).setBackgroundColor(color);
    //     }
    // }

    // private void setTextFont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((TextView) findViewById(R.id.question_layout_titleView1)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.question_layout_titleView2)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.question_layout_titleView3)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.question_layout_button)).setTypeface(typeFace);
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
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

    //     }
    // }

    // /***
    //  * 메일 보내기
    //  *
    //  * @param name    제목
    //  * @param content 내용
    //  */
    // private void sendEmail(String name, String content) {
    //     Intent it = new Intent(Intent.ACTION_SEND);
    //     it.setType("plain/text");
    //     String[] tos = {"kikiplus2030@naver.com"};
    //     it.putExtra(Intent.EXTRA_EMAIL, tos);
    //     it.putExtra(Intent.EXTRA_SUBJECT, name);
    //     it.putExtra(Intent.EXTRA_TEXT, content);
    //     startActivity(it);
    // }

    // private void setTitleIndex(int index) {
    //     mTitleIndex = index;
    //     switch (mTitleIndex) {
    //         case 1:
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.WHITE);
    //             break;
    //         case 2:
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.WHITE);
    //             break;
    //         case 3:
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setBackgroundColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView3)).setTextColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView1)).setTextColor(Color.WHITE);
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setBackgroundColor(Color.parseColor("#FF99CC00"));
    //             ((TextView) findViewById(R.id.question_layout_titleView2)).setTextColor(Color.WHITE);
    //             break;
    //     }
    // }

    // private String getTitleIndex(int index) {
    //     switch (index) {
    //         case 1:
    //             return "오류";
    //         case 2:
    //             return "개선";
    //         case 3:
    //             return "문의";
    //         default:
    //             return "기타";
    //     }
    // }
}