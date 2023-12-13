//
//  ViewController.swift
//  DEACBilayerTabBarViewController
//
//  Created by 12740181 on 12/06/2023.
//  Copyright (c) 2023 12740181. All rights reserved.
//

import UIKit

class ViewController: DEACBilayerTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        self.smallIconArray = ["history_s","team_s","driver_s"]
        self.bigIconArray = ["history_b","team_b","driver_b"]
        self.titleArray = ["历史","车队","车手"]
        self.viewControllerArray = [HistoryViewController(),TeamViewController(),DriverViewController()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

