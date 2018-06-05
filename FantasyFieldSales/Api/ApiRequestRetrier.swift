//
//  ApiRequestRetrier.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Alamofire

class ApiRequestRetrier: RequestRetrier {
    
    init(context: ApiContext, authService: AuthService) {
        self.context = context
        self.authService = authService
    }
    
    
    fileprivate let authService: AuthService
    fileprivate let context: ApiContext
    fileprivate var isAuthorizing = false
    fileprivate var retryQueue = [RequestRetryCompletion]()
    
    
    func should(
        _ manager: SessionManager,
        retry request: Request,
        with error: Error,
        completion: @escaping RequestRetryCompletion) {
        
        guard
            shouldRetryRequest(with: request.request?.url),
            shouldRetryResponse(with: request.response?.statusCode)
            else { return completion(false, 0) }
        
        authorize(with: completion)
    }
    
    
    fileprivate func authorize(with completion: @escaping RequestRetryCompletion) {
        print("Authorizing application...")
        retryQueue.append(completion)
        guard !isAuthorizing else { return }
        isAuthorizing = true
        authService.authorizeApplication { (token, error) in
            self.printAuthResult(token, error)
            self.isAuthorizing = false
            self.context.authToken = token
            let success = token != nil
            self.retryQueue.forEach { $0(success, 0) }
            self.retryQueue.removeAll()
        }
    }
    
    fileprivate func printAuthResult(_ token: String?, _ error: Error?) {
        if let error = error {
            return print("Authorizing failed: \(error.localizedDescription)")
        }
        if let token = token {
            return print("Authorizing succeded: \(token)")
        }
        print("No token received - failing!")
    }
    
    fileprivate func shouldRetryRequest(with url: URL?) -> Bool {
        guard let url = url?.absoluteString else { return false }
        let authPath = ApiRoute.auth.path
        return !url.contains(authPath)
    }
    
    fileprivate func shouldRetryResponse(with statusCode: Int?) -> Bool {
        return true // statusCode == 401
    }
}
