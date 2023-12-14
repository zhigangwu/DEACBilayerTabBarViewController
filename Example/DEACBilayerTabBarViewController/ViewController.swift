//
//  ViewController.swift
//  DEACBilayerTabBarViewController
//
//  Created by 12740181 on 12/06/2023.
//  Copyright (c) 2023 12740181. All rights reserved.
//

import UIKit
import DEACBilayerTabBarViewController

class ViewController: DEACBilayerTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        self.smallIconArray = ["history_s","team_s","driver_s","driver_s"]
        self.bigIconArray = ["history_b","team_b","driver_b","driver_b"]
        self.titleArray = ["历史","车队","车手","新闻"]
        self.bigItemWidth = 50
        self.bigItemHeight = 50
        self.defaultSelectIndex = 1
        self.defaultColor = .lightGray
        self.selectedColor = .orange
        self.viewControllerArray = [HistoryViewController(),TeamViewController(),DriverViewController(),NewsViewController()]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

