//
//  CustomRow.swift
//  EurekaSwift
//
//  Created by Youliang Zhang on 2020/5/8.
//  Copyright © 2020 Youliang Zhang. All rights reserved.
//

import UIKit
import Eureka

public final class CustomRow:Row<CustomCell>,RowType{
    public required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<CustomCell>(nibName: "CustomCell")
    }
}
