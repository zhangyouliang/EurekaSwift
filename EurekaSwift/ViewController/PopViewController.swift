//
//  PopViewController.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit


class PopViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PopViewController"
        self.view.backgroundColor = .white
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        self.view.addSubview(btn)
        btn.setTitleColor(.red, for: .normal)
        btn.setTitle("Close", for: .normal)
        btn.addTarget(self, action: #selector(self.closeAction), for: .touchUpInside)
        
    }
    @objc func closeAction(){
        self.dismiss(animated: true) {
            
        }
    }
}
