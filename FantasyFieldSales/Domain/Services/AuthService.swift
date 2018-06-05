//
//  AuthService.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

typealias AuthResult = (_ token: String?, _ error: Error?) -> ()


protocol AuthService: class {
    
    func authorizeApplication(completion: @escaping AuthResult)
}
