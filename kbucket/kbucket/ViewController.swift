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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        KLog.d(tag: "ViewController", msg: "didReceiveMemoryWarning");
        
    }
    
    @IBAction func onClickWrite(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickWrite");
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
    
    
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}

