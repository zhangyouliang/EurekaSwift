//
//  ViewController.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//
import UIKit
import Eureka

class ViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        form +++
            Section()
            <<< ButtonRow("Eureka 自定义 Cell") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "RowsExampleViewControllerSegue", onDismiss: nil)
            }
            <<< ButtonRow("Push 方式 ViewController(支持右滑返回手势)") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, roe) in
                self.navigationController?.pushViewController(PopViewController(), animated: true)
            })
            <<< ButtonRow("全屏跳转到 NavViewController(present)") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, roe) in
                self.present(FullScreenViewController2(), animated: true, completion: nil)
            })
            <<< ButtonRow("全屏跳转到 NavViewController(支持(右滑,下滑)返回手势)") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, roe) in
                self.presentPanModal(FullScreenNavController())
            })
            <<< ButtonRow("全屏跳转到 ViewController(支持(右滑,下滑)返回手势)") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, roe) in
                self.presentPanModal(FullScreenViewController2())
            })
            <<< ButtonRow("present 普通 ViewController (没有手势)") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, roe) in
                let pvc = PopViewController()
                pvc.isHWPanModal = true
                self.definesPresentationContext = true //self is presenting view
                
                let nav = UINavigationController.init(rootViewController: pvc)
                nav.modalPresentationStyle = UIModalPresentationStyle(rawValue:
                    UIModalPresentationStyle.fullScreen.rawValue
                        &
                        UIModalPresentationStyle.overCurrentContext.rawValue)!
                self.present(nav, animated: true, completion: nil)
            })
        
        
    }
    
    
}





