

import UIKit
import Alamofire

class __AlamofireManager {
    
    // MARK: - Single instance
    public class func shareInstance() -> __AlamofireManager {
        struct singleton {
            static let instance = __AlamofireManager()
        }
        return singleton.instance
    }
    
    /// post请求
    func requestPost(url: String, parameters: [String: Any]?, success: @escaping (_ datas: Parameters?) -> (), failure: @escaping (_ err: String) -> ()) {
        
        request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if let json = response.result.value as? Parameters {
                    __print(json)
                    if let errcode = json["errcode"] as? Int {
                        if errcode == 0 {
                            let data = json["datas"] as? Parameters
                            success(data)
                            return
                        }
                        if let message = json["message"] as? String {
                            failure(message)
                            return
                        }
                    }
                }
                
                failure("请求错误")
            } else {
                failure("请求错误")
            }
        }
    }
    
    /// 上传图片
    func uploadImage(imageData: Data, url: String, success: @escaping (_ image: String) -> (), failure: @escaping (_ err: String) -> ()) {
        
        upload(multipartFormData: { (data) in
            data.append(imageData, withName: "file", fileName: "avatar.jpg", mimeType: "image/jpeg")
        }, to: url) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let json = response.result.value as? Parameters {
                        if let errcode = json["errcode"] as? Int {
                            if errcode == 0 {
                                let data = json["datas"] as? Parameters
                                if let image = data?["image"] as? String {
                                    success(image)
                                    return
                                }
                            }
                            if let message = json["message"] as? String {
                                failure(message)
                                return
                            }
                        }
                    }
                    
                    failure("请求错误")
                }
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    //NSLog("upload image progress - %f", progress.fractionCompleted)
                }
            case .failure(let encodingError):
                __print("request \(url) fail, error is \(String(describing: encodingError))")
                failure("请求错误")
            }
        }
    }
    
    /// 上传视频
    func uploadVideo(fileData: Data, url: String, success: @escaping (_ image: String) -> (), failure: @escaping (_ err: String) -> ()) {
        upload(multipartFormData: { (data) in
            data.append(fileData, withName: "file", fileName: "selfie.MOV", mimeType: "MOV")
        }, to: url) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let json = response.result.value as? Parameters {
                        if let errcode = json["errcode"] as? Int {
                            if errcode == 0 {
                                let data = json["datas"] as? Parameters
                                if let image = data?["video"] as? String {
                                    success(image)
                                    return
                                }
                            }
                            if let message = json["message"] as? String {
                                failure(message)
                                return
                            }
                        }
                    }
                    
                    failure("请求错误")
                }
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    //NSLog("upload image progress - %f", progress.fractionCompleted)
                }
            case .failure(let encodingError):
                __print("request \(url) fail, error is \(String(describing: encodingError))")
                failure("请求错误")
            }
        }
    }
}

