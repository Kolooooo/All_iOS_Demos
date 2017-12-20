//
//  Ken_Common.swift
//  QunhuanTribe
//
//  Created by Ken on 2017/12/15.
//  Copyright © 2017年 GarveyCalvin. All rights reserved.
//

import Foundation

func __print<T>(_ message : T, file : String = #file, lineNumber : Int = #line) {
    // 设置
    // TARGETS --> Build Settings --> Swift Complier - Custom Flags --> Other Swift Flags --> DEBUG
    // 输入：-D DEBUGSWIFT
    #if DEBUGSWIFT
        let fileName = (file as NSString).lastPathComponent
        print("===>>> Class: \(fileName) | Line: \(lineNumber) - \n \(message)")
    #endif
}

/// 空操作
func __nullOperation(){}
