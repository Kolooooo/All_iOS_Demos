////
////  NetworkRequest.swift
////  PanGBaseSwiftProduct
////
////  Created by PanG on 2017/6/9.
////  Copyright © 2017年 PanG. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Alamofire
//
//
//private let NetworkRequestShareInstance = NetworkRequest()
//
//class NetworkRequest {
//    class var sharedInstance : NetworkRequest {
//        return NetworkRequestShareInstance
//    }
//}
//
//extension NetworkRequest {
//    //MARK: - GET 请求
//    //    let tools : NetworkRequest.shareInstance!
//
//
//    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
//
//        //使用Alamofire进行网络请求时，调用该方法的参数都是通过getRequest(urlString， params, success :, failture :）传入的，而success传入的其实是一个接受           [String : AnyObject]类型 返回void类型的函数
//
//        JJHUD.showLoading()
//
//
//        var request = URLRequest.init(url: URL.init(string: urlString)!)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.timeoutInterval = 10 // 10 secs
//
//        Alamofire.request(request).responseJSON {
//            response in
//
//            switch response.result {
//            case .success(let value):
//                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
//                //                    if let value = response.result.value as? [String: AnyObject] {
//                success(value as! [String : AnyObject])
//                //                    }
//                let json = JSON(value)
//                printLog(message: urlString)
//                printLog(message: json)
//            case .failure(let error):
//
//                failture(error)
//                printLog(message: "error:\(error)")
//                JJHUD.hide()
//                JJHUD.showError(text: "网络连接失败, 请检查网络!", delay: 1)
//            }
//            JJHUD.hide()
//        }
//
////
////        let manager = Alamofire.SessionManager.default
////        manager.session.configuration.timeoutIntervalForRequest = 10
////        manager.session.configuration.timeoutIntervalForResource = 10
////
////        manager.request(urlString, method: .get, parameters: params)
////            .responseJSON { (response) in
////                /*这里使用了闭包*/
////                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
////                //使用switch判断请求是否成功，也就是response的result
////
////                switch response.result {
////                case .success(let value):
////                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
////                    //                    if let value = response.result.value as? [String: AnyObject] {
////                    success(value as! [String : AnyObject])
////                    //                    }
////                    let json = JSON(value)
////                    printLog(message: urlString)
////                    printLog(message: json)
////                case .failure(let error):
////
////                    failture(error)
////                    printLog(message: "error:\(error)")
////                    JJHUD.hide()
////                    JJHUD.showError(text: "网络连接失败, 请检查网络!", delay: 1)
////                }
////                JJHUD.hide()
////        }
//////
//    }
//    //  MARK: 标注:使用 POST 请求
//    //MARK: - POST 请求
//    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
//
//        JJHUD.showLoading()
////
////        let manager = Alamofire.SessionManager.default
////
////        manager.session.configuration.timeoutIntervalForRequest = 10
//
//        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
//            switch response.result{
//            case .success:
//                if let value = response.result.value as? [String: AnyObject] {
//                    success(value)
//                    JJHUD.hide()
//
//                    //MARK: 标注: 这里使用SwiftJson,可以作为参考
//                    let json = JSON(value)
//                    printLog(message: params)
//                    printLog(message: json)
//                }
//            case .failure(let error):
//                failture(error)
//                printLog(message: "error:\(error)")
//                JJHUD.hide()
//                JJHUD.showError(text: "网络连接失败, 请检查网络!", delay: 1)
//
//            }
//        }
//    }
//
//    //MARK: - 照片上传
//    ///
//    /// - Parameters:
//    ///   - urlString: 服务器地址
//    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
//    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
//    ///   - data: image转换成Data
//    ///   - name: fileName
//    ///   - success:
//    ///   - failture:
//    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String], imageNames:[String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
//
//        JJHUD.showLoading()
//
//        let headers = ["content-type":"multipart/form-data"]
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            //666多张图片上传
//            let flag = params["flag"]
//            let userId = params["u_id"]
//            var questions = params["questions"]
//            let store = params["store"]
//            let commodity_comment = params["commodity_comment"]
//            let order_refund = params["order_refund"]
//            var order_message = params["order_message"]
//
//            printLog(message: params)
//
//            multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
//            if userId != nil {
//                multipartFormData.append((userId?.data(using: String.Encoding.utf8)!)!, withName: "u_id")
//            }
//
//            questions = questions?.replacingOccurrences(of: "\\", with: "")
//            questions = questions?.replacingOccurrences(of: "\"{", with: "{")
//            questions = questions?.replacingOccurrences(of: "}\"", with: "}")
//
//            order_message = order_message?.replacingOccurrences(of: "\\", with: "")
//            order_message = order_message?.replacingOccurrences(of: "\"{", with: "{")
//            order_message = order_message?.replacingOccurrences(of: "}\"", with: "}")
//
//            if questions != nil {
//                multipartFormData.append((questions?.data(using: String.Encoding.utf8)!)!, withName: "questions")
//                printLog(message: questions)
//            }
//            if store != nil {
//                multipartFormData.append((store?.data(using: String.Encoding.utf8))!, withName: "store")
//                printLog(message: store)
//
//            }
//            if commodity_comment != nil {
//                multipartFormData.append((commodity_comment?.data(using: String.Encoding.utf8))!, withName: "commodity_comment")
//                printLog(message: commodity_comment)
//            }
//            if order_refund != nil {
//                multipartFormData.append((order_refund?.data(using: String.Encoding.utf8))!, withName: "order_refund")
//                printLog(message: order_refund)
//            }
//            if order_message != nil {
//                multipartFormData.append((order_message?.data(using: String.Encoding.utf8))!, withName: "order_message")
//                printLog(message: order_message)
//            }
//
//            for i in 0..<data.count {
//                multipartFormData.append(data[i], withName: imageNames[i], fileName: name[i], mimeType: "image/png")
//
//            }
//        },
//                         to: urlString,
//                         headers: headers,
//                         encodingCompletion: { encodingResult in
//                            switch encodingResult {
//                            case .success(let upload, _, _):
//                                upload.responseJSON { response in
//                                    if let value = response.result.value as? [String: AnyObject]{
//                                        success(value)
//                                        let json = JSON(value)
//                                        printLog(message: json)
//                                        JJHUD.hide()
//                                    }
//                                }
//                            case .failure(let encodingError):
//                                printLog(message: encodingError)
//                                failture(encodingError)
//                                JJHUD.showError(text: "网络连接失败, 请检查网络!", delay: 1)
//
//                            }
//        })
//    }
//
//    func downloadRequest(urlString: String, params: [String : Any], success: @escaping (_ response : [String : AnyObject]) -> (), _ failture : @escaping (_ error : Error)->()) {
//
//        //下载文件的保存路径
//        var destination:DownloadRequest.DownloadFileDestination!
//        //设置下载路径。保存到用户文档目录，文件名不变，如果有同名文件则会覆盖
//        destination = { _, response in
//            let documentsURL = FileManager.default.urls(for: .documentDirectory,
//                                                        in: .userDomainMask)[0]
//            let fileURL = documentsURL.appendingPathComponent(response.suggestedFilename!)
//            //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
//            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
//        }
//
//
//        Alamofire.download(urlString, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: nil, to: destination).responseJSON { (response) in
//
//            switch response.result {
//            case .success:
//                if let value = response.result.value as? [String: AnyObject] {
//                    success(value)
//                    JJHUD.hide()
//
//                    //MARK:
//                    let json = JSON(value)
//                    printLog(message: params)
//                    printLog(message: json)
//                }
//            case .failure(let error):
//                failture(error)
//                printLog(message: "error:\(error)")
//                JJHUD.hide()
//                JJHUD.showError(text: "网络连接失败, 请检查网络!", delay: 1)
//
//            }
//        }
//    }
//}
//
//
