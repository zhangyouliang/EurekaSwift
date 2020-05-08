//
//  TestGestureViewController.swift
//  ios 点击,双击,长按手势
//  拖动事件与右滑手势冲突!!!
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit


class TestGestureViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.addgestures()
    }
    func addgestures(){
        // 单击
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.singleTap))
        singleTap.numberOfTapsRequired = 1
        // 双击
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.doubleTap))
        doubleTap.numberOfTapsRequired = 2
        
        view.addGestureRecognizer(singleTap)
        view.addGestureRecognizer(doubleTap)
        /*
         检测手势识别器方法
         moreTap.require(toFail: singleTap)
         优先检测singleTap,若singleTap检测不到，或检测失败，则检测moreTap,检测成功后，触发方法
         singleTap.require(toFail: moreTap)
         优先检测moreTap,若moreTap检测不到，或检测失败，则检测singleTap,检测成功后，触发方法
         */
        singleTap.require(toFail: doubleTap)
        
        // 长按手势
        let long = UILongPressGestureRecognizer(target: self, action: #selector(longPressWeb));
        view.addGestureRecognizer(long)
        //拖动事件, 任意方向 (与右滑手势冲突)
        //let handDrag = UIPanGestureRecognizer(target: self, action: #selector(funDrag))
        //handDrag.maximumNumberOfTouches = 1
        //view.addGestureRecognizer(handDrag)
        
        
        //左右滑动，不可与拖动事件UIPanGestureRecognizer并存 , 默认只支持向右
        //let handLeftRight = UISwipeGestureRecognizer(target: self, action: #selector(funLeftRight))
        //handLeftRight.direction = .right //支持向左
        //view.addGestureRecognizer(handLeftRight)
    }
    @objc func singleTap(sender:UIPanGestureRecognizer){
        print("+++++ singleTap")
        self.dismiss(animated: true) {
            
        }
    }
    @objc func doubleTap(sender:UIPanGestureRecognizer){
        print("+++++ doubleTap")
    }
    @objc func funLeftRight(sender:UIPanGestureRecognizer){
        print("+++++ funLeftRight")
    }
    @objc func longPressWeb(sender:UILongPressGestureRecognizer){
        if(sender.state == .began){
            print("long preses began")
        }else if(sender.state == .ended){
            print(" long press end")
        }
        print("you do long press");
    }
    
}
