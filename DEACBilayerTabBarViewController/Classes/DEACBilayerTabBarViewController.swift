//
//  DEACBilayerTabBarViewController.swift
//  DEACBilayerTabBarViewController_Example
//
//  Created by Ryan on 2023/12/6.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

open class DEACBilayerTabBarViewController: UITabBarController,UITabBarControllerDelegate {
    
    /*大图标*/
    public var bigIconArray : Array<String> = []
    
    /*小图标*/
    public var smallIconArray : Array<String> = []
    
    /*标题*/
    public var titleArray : Array<String> = []
    
    /**/
    public var viewControllerArray : Array<UIViewController> = [] {
        didSet {
            if viewControllerArray.count > 0 {
                for vc in viewControllerArray {
                    self.addChild(vc)
                }
                if bigIconArray.count > 0 && self.smallIconArray.count > 0 && self.titleArray.count > 0 {
                    layoutMainView()
                }
            }
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.tabBar.backgroundColor = .white
        self.delegate = self
    
    }
    
    private let bigIcon = UIImageView()
    private var bigItemView : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        return view
    }()
    private let itemIconArray : NSMutableArray = []
    private let itemTitleArray : NSMutableArray = []

    func layoutMainView() {
        
        let itemSpacing = (UIScreen.main.bounds.width - CGFloat(50 * self.viewControllerArray.count)) / CGFloat(self.viewControllerArray.count * 2)
                        
        bigItemView.frame = CGRect(x: itemSpacing, y: -20, width: 50, height: 50)
        self.tabBar.addSubview(bigItemView)
        
        bigIcon.image = UIImage(named: self.bigIconArray[0])
        bigIcon.frame = CGRect(x: 3, y: 3, width: bigItemView.frame.width - 6, height: bigItemView.frame.height - 6)
        bigIcon.backgroundColor = .clear
        bigIcon.contentMode = .scaleAspectFit
        bigItemView.addSubview(bigIcon)
        
        for i in 0..<self.viewControllerArray.count {
            let vc = self.viewControllerArray[i]
            vc.tabBarItem.tag = i
            vc.title = self.titleArray[i]
            vc.tabBarItem.image = UIImage(named: self.smallIconArray[i])
            if i == 0 {
                vc.tabBarItem.image = nil
            }
            
            let itemIcon = UIImageView()
            itemIcon.backgroundColor = .clear
            
            if i == 0 {
                itemIcon.alpha = 0
                itemIcon.frame = CGRect(x: itemSpacing + 15 , y: -15, width: 30, height: 30)
            } else {
                let spacing = itemSpacing * CGFloat(i + 1)
                let nSpacing = 15 * CGFloat(1 + 4 * i)
                itemIcon.frame = CGRect(x: spacing + nSpacing , y: 15, width: 30, height: 30)
            }
        }
    }

    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        changeBigItemBorderColor(index: self.selectedIndex)
    }
    
    func changeBigItemBorderColor(index : Int) {
        let itemSpacing = (UIScreen.main.bounds.width - CGFloat(50 * self.viewControllers!.count)) / 6
        
        bigIcon.image = UIImage(named: bigIconArray[index])
        
        for i in 0..<self.viewControllerArray.count {
            let vc = self.viewControllers![i]
            vc.tabBarItem.image = UIImage(named: self.smallIconArray[i])
            vc.tabBarController?.tabBar.tintColor = .red
            
            if vc.tabBarItem.tag == index {
                vc.tabBarItem.image = nil
            }
        }
        
        UIView.animate(withDuration: 0.3) { [self] in
            self.bigItemView.frame = CGRect(x: CGFloat(50 * index) + itemSpacing * CGFloat(index * 2 + 1) , y: -20, width: 50, height: 50)
        } completion: { Bool in

        }
        
//        if index == 0 {
//            tabBar.tintColor = .lightGray
//        } else if index == 1 {
//            self.tabBar.tintColor = .lightGray
//        } else if index == 2 {
//            self.tabBar.tintColor = .lightGray
//        } else if index == 3 {
//            self.tabBar.tintColor = .lightGray
//        }
    }
}
