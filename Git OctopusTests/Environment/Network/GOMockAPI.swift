//
//  GOMockAPI.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Git_Octopus
import QCNetwork

class GOMockAPI: QCAPI {
    
    var lastWebServicesEntry: QCAPIEntry?
    
    var lastTask: URLSessionDataTask?
    
    var shouldTrack: Bool = false
    
    var apiKey: String?
    
    var locale: String = ""
    
    var apiVersion: String = ""
    
    func request(with entry: QCAPIEntry, callback: ((Int) -> Void)?) {
        
        self.lastWebServicesEntry = entry
        
        if self.callbackSucceed {
            callback?(200)
        } else {
            callback?(500)
        }
    }
    
    func request(with entry: QCAPIEntry, success: ((Bool) -> Void)?) {
        
        self.lastWebServicesEntry = entry
        
        if self.callbackSucceed {
            success?(true)
        } else {
            success?(false)
        }
    }
    
    func request(with entry: QCAPIEntry, success: ((Any) -> Void)?, failure: ((URLSessionTask?, Error?, Int) -> Void)?) {
        self.lastWebServicesEntry = entry
        
        if self.callbackSucceed {
            success?(self.mockResponseObject)
        } else {
            failure?(nil, self.errorForFailure, 500)
        }
    }
    
    func handleSuccess(withResponseObject responseObject: Any?, entry: QCAPIEntry, success: ((Any?) -> Void)?) {
        success?(self.mockResponseObject)
    }
    
    func handleFailure(withOperation operation: URLSessionTask?, error: Error?, failure: ((URLSessionTask?, Error?, Int) -> Void)?) {
        failure?(nil, self.errorForFailure, 500)
    }
    
    var callbackSucceed = false
    var mockResponseObject: Any?
    
    lazy var errorForFailure: Error = {
        let response = HTTPURLResponse(url: URL(string: "url")!, statusCode: 500, httpVersion: nil, headerFields: nil)
        var userInfo = [String: Any]()
        userInfo["com.alamofire.serialization.response.error.response"] = response
        return NSError(domain: "domain", code: 500, userInfo: userInfo)
    }()
    
    // MARK: - Get
    
    func loggedGET(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        return nil
    }
    
    // MARK: - Put
    
    func loggedPUT(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        return nil
    }
    
    // MARK: - Post
    
    var loggedPOSTCalled = false
    func loggedPOST(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        return nil
    }
    
    // MARK: - Delete
    
    var loggedDELETECalled = false
    func loggedDELETE(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        return nil
    }
    
    // MARK: - Failure
    
    var processLoggedFailureCalled = false
    func processLoggedFailure(_ failureOperation: URLSessionTask?, token:String?, withCompletion completion: ((Bool, String?) -> Void)?) {
        processLoggedFailureCalled = true
    }

}
