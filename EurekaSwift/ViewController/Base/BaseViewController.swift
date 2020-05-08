//
//  BaseViewController.swift
//  解决去除导航栏,或者自定义返回按钮导致右滑手势失效问题
//
//  Swift - 让导航栏随页面一起移动，而不是淡入淡出?
//  ref: https://www.hangge.com/blog/cache/detail_1117.html
//  storyboard:
//      1. NavigationController: 取消 (shows navigation Bar) 勾选
//      2. Navigation bar: 取消 (translucent) 勾选
// 纯代码:
//      1.隐藏导航栏 self.navigationController?.navigationBar.isHidden = true
//      2.导航栏半透明关闭 self.navigationController?.navigationBar.isTranslucent=false
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit

class BaseViewController:UIViewController,UIGestureRecognizerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
