//
//  CustomCell.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//
import UIKit
import Eureka

public class CustomCell:Cell<Bool>,CellType{
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var label: UILabel!


    public override func setup() {
        super.setup()
        switchControl.addTarget(self, action: #selector(CustomCell.switchValueChanged), for: .valueChanged)
    }
    @objc func switchValueChanged(){
        row.value = switchControl.isOn
        row.updateCell() // Re-draws the cell which calls 'update' bellow
    }
    public override func update() {
           super.update()
           backgroundColor = (row.value ?? false) ? .white : .black
       }
}
