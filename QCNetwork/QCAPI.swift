//
//  QCAPI.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 26/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCAPI {
    
    func loggedGET(_ URLString: String, parameters: Any?, success successBlock: ((_ operation: URLSessionTask?, _ responseObject: Any?) -> Void)?, failure: ((_ operation: URLSessionTask?, _ error: Error?) -> Void)?) -> URLSessionDataTask?
    
    func loggedPOST(_ URLString: String, parameters: Any?, success successBlock: ((_ operation: URLSessionTask?, _ responseObject: Any?) -> Void)?, failure: ((_ operation: URLSessionTask?, _ error: Error?) -> Void)?) -> URLSessionDataTask?
    
    func loggedPUT(_ URLString: String, parameters: Any?, success successBlock: ((_ operation: URLSessionTask?, _ responseObject: Any?) -> Void)?, failure: ((_ operation: URLSessionTask?, _ error: Error?) -> Void)?) -> URLSessionDataTask? 

    func loggedDELETE(_ URLString: String, parameters: Any?, success successBlock: ((_ operation: URLSessionTask?, _ responseObject: Any?) -> Void)?, failure: ((_ operation: URLSessionTask?, _ error: Error?) -> Void)?) -> URLSessionDataTask?
    
    func processLoggedFailure(_ failureOperation: URLSessionTask?, token: String?, withCompletion completion: ((_ success: Bool, _ token: String?) -> Void)?)
    
    var lastWebServicesEntry: QCAPIEntry? { get set }
    var lastTask: URLSessionDataTask? { get set }
    
    func request(with entry: QCAPIEntry, callback: ((_ statusCode: Int) -> Void)?)
    func request(with entry: QCAPIEntry, success: ((_ success: Bool) -> Void)?)
    func request(with entry: QCAPIEntry, success: ((_ responseObject: Any) -> Void)?,
                 failure: ((_ operation: URLSessionTask?, _ error: Error?, _ statusCode: Int) -> Void)?)
    
    
    func handleSuccess(withResponseObject responseObject: Any?, entry: QCAPIEntry, success: ((_ responseObject: Any?) -> Void)?)
    
    func handleFailure(withOperation operation: URLSessionTask?, error: Error?, failure: ((_ operation: URLSessionTask?, _ error: Error?, _ statusCode: Int) -> Void)?)

}
