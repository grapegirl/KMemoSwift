//
//  WriteViewCtlr.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 8. 20..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit
import Foundation

class WriteViewCtrl : UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    let titles = ["Test1","Test2","Test3", "Test4", "Test5"]
        
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "WriteViewCtrl", msg: "viewDidLoad");
    
        mTableView.delegate = self
        mTableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        
        cell.btEdt.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(tableview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableview.deselectRow(at: indexPath as IndexPath, animated: true)
        let row = indexPath.row
        print(titles[row])
    }
    

    
}
