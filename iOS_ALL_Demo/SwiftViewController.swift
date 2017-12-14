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
        
        
        let string = "1234"
        
        let intValue: Int = Int(string) ?? 0
        print(intValue)
        
        let doubleValue: Double = Double(string) ?? 0.0
        print(doubleValue)
    }
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
    
    
    
    
    // MARK: View structure
    // MARK: View layout
    // MARK: View action
}

// MARK: - Setter

// MARK: - Lazy load
