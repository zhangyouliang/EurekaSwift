//
//  BaseViewController.swift
//  navigationBar 默认隐藏,如果普通 ViewController 只需要设置 title ,或者调用 showNav() 即可显示
//  如果使用 HWPanModa 弹出的窗口, navigationBar 貌似默认都不显示,这时需要设置 isHWPanModal,使用自定义 navigationBar
//
//  不在 navigationController 设置隐藏 navigationBar,是为了兼容导入的第三方库,防止不小心将第三方库的 navigationBar隐藏了
//  是否隐藏 navigationBar(仅管理继承 BaseViewController 的 ViewController)
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController:UIViewController,UIGestureRecognizerDelegate{
    /**是否使用 HWPanModa */
    var isHWPanModal:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  解决去除导航栏,或者自定义返回按钮导致右滑手势失效问题
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        // 隐藏导航栏(仅仅修改继承 BaseViewController 的 ViewController)
        self.fd_prefersNavigationBarHidden = true
        // 隐藏导航栏(隐藏 navigationController push 到的全部 ViewController,存在副作用,不太灵活)
        // 举个例子: 我们在 Eureka 自定义 Cell > LocationView 地图里面,发现导航栏丢失了,导致无法返回(该ViewController 未继承 UIViewController !!!)
        // 副作用: 导致全部的 ViewController 丢失了导航栏
        //self.navigationController?.navigationBar.isTranslucent=false
        //self.navigationController?.navigationBar.isHidden = true
    }
    func showNav(){
        self.fd_prefersNavigationBarHidden = false

        let image = UIImage.init(named: "ic_navi_back")
        let leftItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backAction))
        leftItem.tintColor = .red
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    /**
     HWPanModal 全屏弹出时没有 navigationItem
     这里自定义一个
     */
    private func customPanModalNavBar(title:String){
        let navBarView = UIView()
        self.view.addSubview(navBarView)
        navBarView.backgroundColor = .white
        navBarView.snp.makeConstraints { (make) in
            make.top.equalTo(kTabbarH)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        let backView = UIButton(type: .custom)
        backView.setImage(UIImage(named: "ic_navi_back"), for: .normal)
        backView.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        navBarView.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        let titleView = UILabel()
        titleView.textColor = .red
        titleView.text = title
        navBarView.addSubview(titleView)
        titleView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isHWPanModal {
            customPanModalNavBar(title: self.title ?? "")
        }else if title != nil{
            self.showNav()
        }
    }
    
    @objc private func backAction(){
        self.navigationController?.popViewController(animated: true)
    }

}
