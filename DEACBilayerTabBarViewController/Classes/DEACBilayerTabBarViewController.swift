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
    
    /*大图标尺寸*/
    public var bigItemWidth : Double? = 0
    public var bigItemHeight : Double? = 0
    
    /*默认选中项*/
    public var defaultSelectIndex : Int = 0 {
        didSet {
            self.currentIndex = defaultSelectIndex
        }
    }
    
    /*bigItem背景颜色*/
    public var bigItemBackgroundColor : UIColor? = nil {
        didSet {
            if bigItemBackgroundColor != nil {
                bigItemView.backgroundColor = bigItemBackgroundColor
            }
        }
    }
    
    /*默认颜色*/
    public var defaultColor : UIColor?  {
        didSet {
            self.tabBarController?.tabBar.tintColor = defaultColor
        }
    }
    
    /*点击颜色*/
    public var selectedColor : UIColor? = .black
    
    /**/
    public var viewControllerArray : Array<UIViewController> = [] {
        didSet {
            if viewControllerArray.count > 0 {
                for vc in viewControllerArray {
                    self.addChild(vc)
                }
                if bigIconArray.count > 0 && self.smallIconArray.count > 0 && self.titleArray.count > 0 && bigItemWidth! > 0 && bigItemHeight! > 0 {
                    if bigIconArray.count == smallIconArray.count &&
                        bigIconArray.count == titleArray.count &&
                        bigIconArray.count == viewControllerArray.count {
                        layoutMainView()
                    } else {
                        print("配置数据count不一致")
                    }
                }
            }
        }
    }
    
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.tabBar.backgroundColor = .white
//        self.tabBarController?.tabBar.tintColor = .lightGray
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
    private var currentIndex : Int = 0
    private var animateBool : Bool = false

    func layoutMainView() {
        
        let itemSpacing = (UIScreen.main.bounds.width - CGFloat(Int(bigItemWidth!) * self.viewControllerArray.count)) / CGFloat(self.viewControllerArray.count * 2)
        
        let samllIconSpacing = (UIScreen.main.bounds.width - CGFloat(25 * self.viewControllerArray.count)) / CGFloat(self.viewControllerArray.count * 2)
        
        let titleLabelSpacing = UIScreen.main.bounds.width / Double(self.viewControllerArray.count)
                        
        bigItemView.frame = CGRect(x: CGFloat(Int(bigItemWidth!) * defaultSelectIndex) + itemSpacing * CGFloat(defaultSelectIndex * 2 + 1),
                                   y: -20,
                                   width: bigItemWidth!,
                                   height: bigItemHeight!)
        self.tabBar.addSubview(bigItemView)
        
        bigIcon.image = UIImage(named: self.bigIconArray[defaultSelectIndex])
        bigIcon.frame = CGRect(x: 3, y: 3, width: bigItemWidth! - 6, height: bigItemHeight! - 6)
        bigIcon.backgroundColor = .clear
        bigIcon.contentMode = .scaleAspectFit
        bigItemView.addSubview(bigIcon)
        
        for i in 0..<self.viewControllerArray.count {
            self.tabBarController?.tabBar.tintColor = defaultColor
            let vc = self.viewControllerArray[i]
            vc.tabBarItem.tag = i
            
            let smallIcon = UIImageView(image: UIImage(named: self.smallIconArray[i]))
            smallIcon.tag = i
            smallIcon.frame = CGRect(x:  CGFloat(25 * i) + samllIconSpacing * CGFloat(i * 2 + 1)  , y: 5, width: 25, height: 25)
            self.tabBar.addSubview(smallIcon)
            self.itemIconArray.add(smallIcon)
            
            let titleLabel = UILabel()
            titleLabel.frame = CGRect(x: titleLabelSpacing * CGFloat(i)  , y: 5 + 25 + 5, width: titleLabelSpacing, height: 12)
            titleLabel.tag = i
            titleLabel.font = UIFont.systemFont(ofSize: 8)
            titleLabel.textAlignment = .center
            titleLabel.text = self.titleArray[i]
            self.tabBar.addSubview(titleLabel)
            self.itemTitleArray.add(titleLabel)
            
            if i == defaultSelectIndex {
                smallIcon.alpha = 0
                smallIcon.frame = CGRect(x: CGFloat(25 * i) + samllIconSpacing * CGFloat(i * 2 + 1),
                                         y: self.bigItemView.center.y - 25 / 2,
                                         width: 25, height: 25)
                titleLabel.textColor = selectedColor
            } else {
                titleLabel.textColor = defaultColor
            }
        }
    }

    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        changeBigItemBorderColor(index: self.selectedIndex)
    }
    
    func changeBigItemBorderColor(index : Int) {
        if animateBool == true {return}
        animateBool = true
        let itemSpacing = (UIScreen.main.bounds.width - CGFloat(Int(bigItemWidth!) * self.viewControllers!.count)) / CGFloat(self.viewControllerArray.count * 2)
        
        let samllIconSpacing = (UIScreen.main.bounds.width - CGFloat(25 * self.viewControllerArray.count)) / CGFloat(self.viewControllerArray.count * 2)
        
        let titleLabelSpacing = UIScreen.main.bounds.width / Double(self.viewControllerArray.count)
        
        bigIcon.image = UIImage(named: bigIconArray[index])
        
        if currentIndex != index {
            let smallIcon : UIImageView = self.itemIconArray[currentIndex] as! UIImageView
            UIView.animate(withDuration: 0.4) {
                smallIcon.alpha = 1
                smallIcon.frame = CGRect(x: CGFloat(25 * self.currentIndex) + samllIconSpacing * CGFloat(self.currentIndex * 2 + 1),
                                         y: 5,
                                         width: 25, height: 25)
            }
        }
        
        UIView.animate(withDuration: 0.3) { [self] in
            self.bigItemView.frame = CGRect(x: CGFloat(Int(bigItemWidth!) * index) + itemSpacing * CGFloat(index * 2 + 1) , y: -20, width: bigItemWidth!, height: bigItemHeight!)
        }
        
        for i in 0..<self.viewControllerArray.count {
            if currentIndex != index {
                let vc = self.viewControllers![i]
                let titleLabel : UILabel = self.itemTitleArray[i] as! UILabel
                
                if vc.tabBarItem.tag == index {
                    let smallIcon : UIImageView = self.itemIconArray[index] as! UIImageView
                    UIView.animate(withDuration: 0.4) {
                        smallIcon.alpha = 0
                        smallIcon.frame = CGRect(x: CGFloat(25 * index) + samllIconSpacing * CGFloat(index * 2 + 1),
                                                 y: self.bigItemView.center.y - 25 / 2,
                                                 width: 25, height: 25)
                    } completion: { Bool in
                        self.currentIndex = index
                        self.animateBool = false
                    }
                    
                    titleLabel.textColor = selectedColor
                } else {
                    titleLabel.textColor = defaultColor
                }
            }
        }
    }

}
