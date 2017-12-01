//
//  SetBackColorView.swift
//  사용자 테마 설정
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class SetBackColorView : UIViewController {

    private let TAG : String = "SetBackColorView"
    private var mImageButton = Array<UIButton>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }
    
    func initialize(){
        setButtons()
    //     AppUtils.sendTrackerScreen(this, "테마변경화면");
    }


    private func setButtons() {
        // mImageButton = new ImageButton[18];
        // mImageButton[0] = ((ImageButton) findViewById(R.id.set_back_btn1));
        // mImageButton[1] = ((ImageButton) findViewById(R.id.set_back_btn2));
        // mImageButton[2] = ((ImageButton) findViewById(R.id.set_back_btn3));
        // mImageButton[3] = ((ImageButton) findViewById(R.id.set_back_btn4));
        // mImageButton[4] = ((ImageButton) findViewById(R.id.set_back_btn5));
        // mImageButton[5] = ((ImageButton) findViewById(R.id.set_back_btn6));
        // mImageButton[6] = ((ImageButton) findViewById(R.id.set_back_btn7));
        // mImageButton[7] = ((ImageButton) findViewById(R.id.set_back_btn8));
        // mImageButton[8] = ((ImageButton) findViewById(R.id.set_back_btn9));
        // mImageButton[9] = ((ImageButton) findViewById(R.id.set_back_btn10));
        // mImageButton[10] = ((ImageButton) findViewById(R.id.set_back_btn11));
        // mImageButton[11] = ((ImageButton) findViewById(R.id.set_back_btn12));
        // mImageButton[12] = ((ImageButton) findViewById(R.id.set_back_btn13));
        // mImageButton[13] = ((ImageButton) findViewById(R.id.set_back_btn14));
        // mImageButton[14] = ((ImageButton) findViewById(R.id.set_back_btn15));
        // mImageButton[15] = ((ImageButton) findViewById(R.id.set_back_btn16));
        // mImageButton[16] = ((ImageButton) findViewById(R.id.set_back_btn17));
        // mImageButton[17] = ((ImageButton) findViewById(R.id.set_back_btn18));

        // for (int i = 0; i < 18; i++) {
        //     mImageButton[i].setOnClickListener(this);
        // }
    }

    @IBAction func onClick(_ sender: Any) {

    }
    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
    //         case R.id.set_back_btn1:
    //         case R.id.set_back_btn2:
    //         case R.id.set_back_btn3:
    //         case R.id.set_back_btn4:
    //         case R.id.set_back_btn5:
    //         case R.id.set_back_btn6:
    //         case R.id.set_back_btn7:
    //         case R.id.set_back_btn8:
    //         case R.id.set_back_btn9:
    //         case R.id.set_back_btn10:
    //         case R.id.set_back_btn11:
    //         case R.id.set_back_btn12:
    //         case R.id.set_back_btn13:
    //         case R.id.set_back_btn14:
    //         case R.id.set_back_btn15:
    //         case R.id.set_back_btn16:
    //         case R.id.set_back_btn17:
    //         case R.id.set_back_btn18:
    //             ColorDrawable colorDrawable = (ColorDrawable) (((ImageButton) findViewById(v.getId())).getBackground());
    //             int backColor = colorDrawable.getColor();
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.BACK_MEMO, backColor);
    //             KLog.d(TAG, "@@ select Back Color : " + backColor + "");
    //             checkButton(v.getId());
    //             break;
    //     }

    // }

    private func checkButton( buttonId : Int) {
        // for (int i = 0; i < 18; i++) {
        //     int vid = mImageButton[i].getId();
        //     if (vid == buttonId) {
        //         mImageButton[i].setImageResource(R.drawable.mark);
        //     } else {
        //         mImageButton[i].setImageDrawable(null);
        //     }
        // }
    }

   @IBAction func onBackPressed(_ sender: Any) {
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }
}
