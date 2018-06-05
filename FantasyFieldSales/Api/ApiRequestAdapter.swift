//
//  ApiRequestAdapter.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Alamofire

class ApiRequestAdapter: RequestAdapter {
    
    public init(context: ApiContext) {
        self.context = context
    }
    
    
    fileprivate let context: ApiContext
    
    
    func adapt(_ request: URLRequest) throws -> URLRequest {
        //   guard let token = context.authToken else { return request }
        var request = request
        //   request.setValue(token, forHTTPHeaderField: "AUTH_TOKEN")
        return request
    }
}
