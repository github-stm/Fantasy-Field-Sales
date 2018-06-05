//
//  AlamofireAuthService.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AlamofireAuthService: AlamofireService, AuthService {
    
    func authorizeApplication(completion: @escaping AuthResult) {
        get(at: .auth).responseString {
            (res: DataResponse<String>) in
            if let token = res.result.value {
                self.context.authToken = token
            }
            completion(res.result.value, res.result.error)
        }
    }
}
