//
//  ModalViewController.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit
import HWPanModal

class FullScreenNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(FullScreenViewController(nibName: nil, bundle: nil), animated: false)
    }
    
    override func topOffset() -> CGFloat {
        return 0
    }
    
    override func transitionDuration() -> TimeInterval {
        return 0.5
    }
        
    override func shouldRoundTopCorners() -> Bool {
        return false
    }
    
    override func showDragIndicator() -> Bool {
        return false
    }
    
    override func allowScreenEdgeInteractive() -> Bool {
        return true
    }
    
}

fileprivate class FullScreenViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fd_prefersNavigationBarHidden = true
        isHWPanModal = true

        
        view.backgroundColor = .white
        title = "Full Screen"
        
        let rightItem = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem = rightItem
        
        let label = UILabel(frame: .zero)
        label.text = "Drag To Dismiss"
        view.addSubview(label)
        
    }
    
    @objc func nextAction() {
        let nextPage = FullScreenViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
}
