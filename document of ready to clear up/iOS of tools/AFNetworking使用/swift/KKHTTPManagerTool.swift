//
//  KKHTTPManager.swift
//  HunLiMao_swift
//
//  Created by Sunny_Ken_MacBook on 16/4/8.
//  Copyright © 2016年 Sunny_Ken. All rights reserved.
//

import UIKit
import AFNetworking

class KKHTTPManagerTool: NSObject {

    static let sharedInstance: KKHTTPManagerTool = KKHTTPManagerTool()
    private let afnManager: AFHTTPSessionManager = AFHTTPSessionManager(baseURL: KKBaseURL)
    
    private override init() {
        super.init()
        afnManager.responseSerializer.acceptableContentTypes?.insert("text/plain")
    }
    
    /// 封装GET请求
    func requestGET(URLString: String, parameters: AnyObject?, requestCallback: (result: AnyObject?, error: NSError?) -> ()) {
        afnManager.GET(URLString, parameters: parameters, progress: nil, success: { (_, result) -> Void in
            
            requestCallback(result: dict, error: nil)
            
            }) { (_, error) -> Void in
                
                requestCallback(result: nil, error: error)
                
        }
    }
    
    /// 封装POST请求
    func requestPOST(URLString: String, parameters: AnyObject?, requestCallback: (result: AnyObject?, error: NSError?) -> ()) {
        afnManager.POST(URLString, parameters: parameters, progress: nil, success: { (_, result) -> Void in

            requestCallback(result: dict, error: nil)
            }) { (_, error) -> Void in
                requestCallback(result: nil, error: error)
        }
    }
}
