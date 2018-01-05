//
//  SwiftViewController.swift
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/11/14.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

import UIKit


// MARK: - Enum

class SwiftViewController: UIViewController {
    // MARK: - View property
    
    // MARK: - Data property
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
        initRequest()
    }
    
    // MARK: - Public method
    
    // MARK: - Private method
    
    // MARK: - Delegate method
    
    // MARK: - Data request & Data processing
    private func initData(){
        
    }
    
    private func initRequest(){
        
    }
    
    // MARK: - View layout
    private func initUI(){
        // MARK: View style
        
        // MARK: 通过xib 加载view
        let xibView = XibView.__viewFormXib()
        xibView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        view.addSubview(xibView)
        
        __print("\(self)")
        
        let string = "Hello"
        let name = type(of: string)
        let nameString = name.init()
        print(name)
        
        // MARK: View structure
        // MARK: View layout
        // MARK: View action
    }
    
    // MARK: - Setter
    
    // MARK: - Lazy load
}



