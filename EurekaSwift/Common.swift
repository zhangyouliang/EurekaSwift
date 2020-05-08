//
//  Common.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import Foundation


let TOOLBAR_HEIGHT: CGFloat = 44
// 屏幕宽度
let kScreenW = UIScreen.main.bounds.size.width
// 屏幕高度
let kScreenH = UIScreen.main.bounds.size.height

//适配iPhoneX
let is_iPhoneX = (kScreenW == 375.0 && kScreenH == 812.0 ?true:false)
let kNavibarH: CGFloat = is_iPhoneX ? 88.0 : 64.0
let kTabbarH: CGFloat = is_iPhoneX ? 49.0+34.0 : 49.0
let kStatusbarH: CGFloat = is_iPhoneX ? 44.0 : 20.0
let iPhoneXBottomH: CGFloat = 34.0
let iPhoneXTopH: CGFloat = 24.0
