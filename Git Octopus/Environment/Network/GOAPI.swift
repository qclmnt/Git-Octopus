//
//  GOAPI.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 05/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Alamofire

import QCNetwork

class GOAPI: QCAPI {
    
    static let headers = ["Accept": "application/json",
                          "Cache-Control": "no-cache"] // Modify this if you need cache on server side
    
    // MARK: - Api methods
    
    func loggedGET(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        
        guard let params = parameters as? Parameters else {return nil}
        Alamofire.request(URLString, method: .get, parameters: params, encoding: QCEncoding(), headers: GOAPI.headers).responseJSON { (anyResponse) in
            if let json = anyResponse.result.value {
                successBlock?(nil, json)
            } else {
                failure?(nil,nil)
            }
        }
        
        // TODO : return URLSessionDataTask to manage it when needed
        return nil
    }
    
    func loggedPOST(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        
        guard let params = parameters as? Parameters else {return nil}
        Alamofire.request(URLString, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: GOAPI.headers).responseJSON { (anyResponse) in
            if let json = anyResponse.result.value {
                successBlock?(nil, json)
            } else {
                failure?(nil,nil)
            }
        }
        
        // TODO : return URLSessionDataTask to manage it when needed
        return nil
    }
    
    func loggedPUT(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        
        guard let params = parameters as? Parameters else {return nil}
        Alamofire.request(URLString, method: .put, parameters: params, encoding: URLEncoding.httpBody, headers: GOAPI.headers).responseJSON { (anyResponse) in
            if let json = anyResponse.result.value {
                successBlock?(nil, json)
            } else {
                failure?(nil,nil)
            }
        }
        
        // TODO : return URLSessionDataTask to manage it when needed
        return nil
    }
    
    func loggedDELETE(_ URLString: String, parameters: Any?, success successBlock: ((URLSessionTask?, Any?) -> Void)?, failure: ((URLSessionTask?, Error?) -> Void)?) -> URLSessionDataTask? {
        
        guard let params = parameters as? Parameters else {return nil}
        Alamofire.request(URLString, method: .delete, parameters: params, encoding: URLEncoding.httpBody, headers: GOAPI.headers).responseJSON { (anyResponse) in
            if let json = anyResponse.result.value {
                successBlock?(nil, json)
            } else {
                failure?(nil,nil)
            }
        }
        
        // TODO : return URLSessionDataTask to manage it when needed
        return nil
    }
    
    // MARK: - Failure implementation
    
    func processLoggedFailure(_ failureOperation: URLSessionTask?, token: String?, withCompletion completion: ((Bool, String?) -> Void)?) {
        // Todo: implement when needed
    }
    
    // MARK: - Last infos
    
    var lastWebServicesEntry: QCAPIEntry?
    var lastTask: URLSessionDataTask?
    
    // MARK: - Request
    
    func request(with entry: QCAPIEntry, callback: ((Int) -> Void)?) {
        self.request(with: entry, success: { (response) in
            callback?(200)
        }) { (task, error, statusCode) in
            callback?(statusCode)
        }
    }
    
    func request(with entry: QCAPIEntry, success: ((Bool) -> Void)?) {
        self.request(with: entry, success: { (response) in
            success?(true)
        }) { (task, error, statusCode) in
            success?(false)
        }
    }
    
    func request(with entry: QCAPIEntry, success: ((Any) -> Void)?, failure: ((URLSessionTask?, Error?, Int) -> Void)?) {
        let path = "\(entry.basePath)/\(entry.path)"
        let params = entry.entryParameters ?? [AnyHashable: Any]()
        
        self.lastWebServicesEntry = entry
        
        switch entry.method {
        case .get:
            self.lastTask = self.loggedGET(path, parameters: params, success: { [weak self] (_ operation: URLSessionTask?, _ responseObject: Any) -> Void in
                self?.handleSuccess(withResponseObject: responseObject, entry: entry, success: success)
                }, failure: { [weak self] (_ operation: URLSessionTask?, _ error: Error?) -> Void in
                    self?.handleFailure(withOperation: operation, error: error, failure: failure)
            })
            
        case .post:
            self.lastTask = self.loggedPOST(path, parameters: params, success: { [weak self] (_ operation: URLSessionTask?, _ responseObject: Any) -> Void in
                self?.handleSuccess(withResponseObject: responseObject, entry: entry, success: success)
                }, failure: { [weak self] (_ operation: URLSessionTask?, _ error: Error?) -> Void in
                    self?.handleFailure(withOperation: operation, error: error, failure: failure)
            })
            
        case .put:
            self.lastTask = self.loggedPUT(path, parameters: params, success: { [weak self] (_ operation: URLSessionTask?, _ responseObject: Any) -> Void in
                self?.handleSuccess(withResponseObject: responseObject, entry: entry, success: success)
                }, failure: { [weak self] (_ operation: URLSessionTask?, _ error: Error?) -> Void in
                    self?.handleFailure(withOperation: operation, error: error, failure: failure)
            })
            
        case .delete:
            self.lastTask = self.loggedDELETE(path, parameters: params, success: { [weak self] (_ operation: URLSessionTask?, _ responseObject: Any) -> Void in
                self?.handleSuccess(withResponseObject: responseObject, entry: entry, success: success)
                }, failure: { [weak self] (_ operation: URLSessionTask?, _ error: Error?) -> Void in
                    self?.handleFailure(withOperation: operation, error: error, failure: failure)
            })
        }
    }
    
    // MARK: - Handle response
    
    func handleSuccess(withResponseObject responseObject: Any?, entry: QCAPIEntry, success: ((Any?) -> Void)?) {
        success?(entry.parsing(responseObject: responseObject))
    }
    
    func handleFailure(withOperation operation: URLSessionTask?, error: Error?, failure: ((URLSessionTask?, Error?, Int) -> Void)?) {
        failure?(operation, error, 500)
    }
}

// Custom Parameter encoding: to avoid encoding from Alamofire

class QCEncoding: ParameterEncoding {
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        
        guard let url = request.url,
            let params = parameters else {return request}
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + self.query(params)
            urlComponents.percentEncodedQuery = percentEncodedQuery.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            request.url = urlComponents.url
        }
        return request
    }
    
    func query(_ parameters: [String: Any]) -> String {
        var components: [(String, Any)] = []
        
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components.append((key, value))
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}
