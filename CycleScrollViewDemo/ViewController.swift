//
//  ViewController.swift
//  CycleScrollViewDemo
//
//  Created by fengche on 15/8/7.
//  Copyright (c) 2015年 fengche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cycleSCrollDemoView = CycleScrollDemoView(frame: self.view.frame);
        self.view.addSubview(cycleSCrollDemoView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

