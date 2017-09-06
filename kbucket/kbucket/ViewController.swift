//
//  ViewController.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 6. 16..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var btWrite: UIButton!
    @IBOutlet weak var btComplete: UIButton!
    @IBOutlet weak var btShare: UIButton!
    @IBOutlet weak var btRank: UIButton!
    @IBOutlet weak var btSetting: UIButton!
    @IBOutlet weak var btAI: UIButton!
    @IBOutlet weak var btNotice: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "ViewController", msg: "viewDidLoad");
       
        var temp = DateUtils.getStringDateFormat(pattern : "yyyy-MM-dd")
        KLog.d(tag: "ViewController", msg: temp)
        temp = DateUtils.getCurrentTimeHHMMSSMS()
        KLog.d(tag: "ViewController", msg: temp)
        temp = DateUtils.convertTime()
        KLog.d(tag: "ViewController", msg: temp)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         KLog.d(tag: "ViewController", msg: "viewWillAppear");
    }
    
    override func viewDidAppear(_ animated: Bool) {
      KLog.d(tag: "ViewController", msg: "viewDidAppear");
        
        Toast.showToast(message: "enjoy your programming")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        KLog.d(tag: "ViewController", msg: "viewWillDisappear");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         KLog.d(tag: "ViewController", msg: "viewDidDisappear");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        KLog.d(tag: "ViewController", msg: "didReceiveMemoryWarning");
        
    }
    
    
    @IBAction func onClickWriteBucket(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickWriteBucket");
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: "WriteViewCtrl")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
        
    }

    
    @IBAction func onClickComplete(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickComplete");
       
    }
    
    @IBAction func onClickShare(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickShare");
    }
    
    @IBAction func onClickRank(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickRank");
    }
    
    @IBAction func onClickSetting(_ sender: Any) {
         KLog.d(tag: "ViewController", msg: "onClickSetting");
    }
    @IBAction func onClickAI(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickAI");

    }
    
    @IBAction func onClickNotice(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickNotice");

    }
}

