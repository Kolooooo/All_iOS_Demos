//
//  UIView+__Extension.swift
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/12/23.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

import UIKit

extension UIView{
    public class func __viewFormXib() -> UIView{
        let nibName = "\(self)"
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! UIView
    }
}
