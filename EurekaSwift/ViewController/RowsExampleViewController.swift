//
//  RowsExampleViewController.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit
import Eureka
import MapKit

class RowsExampleViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        self.tableView.backgroundColor = .cyan
        // 开启导航辅助，并且遇到被禁用的行就隐藏导航
        navigationOptions = RowNavigationOptions.Enabled.union(.Disabled)
        // 开启流畅地滚动到之前没有显示出来的行
        animateScroll = true
        
        initView()
        
    }

    func initView(){
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Text Row "
                row.placeholder = "Enter text here"
                row.value = "默认值"
            }.cellSetup({ (cell, row) in
                // 仅调用一次
                cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
                cell.textField.tintColor = .red // 光标颜色
                cell.textField.backgroundColor = .gray
            }).cellUpdate({ (cell, row) in
                // 每次显示在屏幕上时
                cell.textLabel?.textColor = .red // 文本颜色
                cell.textField.font = UIFont.systemFont(ofSize: 15) // 字体大小
                cell.textField.textColor = .yellow // 文本颜色
            }).onChange({ (row) in
                
            }).onCellSelection({ (cell, row) in
                // 点击时
                
            })
            <<< NameRow(){
                $0.title = "Name Row"
                $0.placeholder = "Add Name Row"
            }
            <<< SwitchRow("SwitchRow") { row in      // 初始化函数
                    row.title = "The title"
                }.onChange { row in
                    row.title = (row.value ?? false) ? "The title expands when on" : "The title"
                    row.updateCell()
                }.cellSetup { cell, row in
                    cell.backgroundColor = .lightGray
                }.cellUpdate { cell, row in
                    cell.textLabel?.font = .italicSystemFont(ofSize: 18.0)
            }
        +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
            <<< CustomRow(){
                $0.title = "自定义 Row"
            }
            <<< LocationRow(){
                $0.title = "LocationRow"
                $0.value = CLLocation(latitude: -34.9124, longitude: -56.1594)
            }
        +++ Section("s1"){ section in // 文字不显示
            var header = HeaderFooterView<UIView>(.callback({ () -> UIView in
                let view = UIView(frame: .zero)
                view.backgroundColor = .gray
                let subView = UIButton(frame: CGRect(x: 20, y: 25, width: self.view.bounds.width - 40, height: 50))
                subView.setTitle("登录", for: .normal)
                subView.backgroundColor = UIColor(red:0.46, green:0.35, blue:0.88, alpha:1.00)
                subView.layer.masksToBounds = true
                subView.layer.cornerRadius = 10
                view.addSubview(subView)
                return view
            }))
            header.height = {100}
            section.header = header
        }
        +++ Section(){ section in
            var header = HeaderFooterView<UIView>(.callback({ () -> UIView in
                let view = UIView(frame: .zero)
                view.backgroundColor = .gray
                let subView = UIButton(frame: CGRect(x: 20, y: 25, width: self.view.bounds.width - 40, height: 50))
                subView.setTitle("登录", for: .normal)
                subView.backgroundColor = UIColor(red:0.46, green:0.35, blue:0.88, alpha:1.00)
                subView.layer.masksToBounds = true
                subView.layer.cornerRadius = 10
                view.addSubview(subView)
                return view
            }))
            header.height = {100}
            section.header = header
            // header每次出现在屏幕的时候调用
            header.onSetupView = { view,_ in
                // 通常是在这修改view里面的文字
                // 不要在这修改view的大小或者层级关系
                view.backgroundColor = .yellow
            }
            section.footer = header
        }
        +++ Section(){ section in
            var header = HeaderFooterView<UIView>(.callback({ () -> UIView in
                let view = UIView(frame: .zero)
                view.backgroundColor = .gray
                let subView = UIButton(frame: CGRect(x: 20, y: 25, width: self.view.bounds.width - 40, height: 50))
                subView.setTitle("登录", for: .normal)
                subView.backgroundColor = UIColor(red:0.46, green:0.35, blue:0.88, alpha:1.00)
                subView.layer.masksToBounds = true
                subView.layer.cornerRadius = 10
                view.addSubview(subView)
                return view
            }))
            header.height = {100}
            section.header = header
        }
    }
}






