//
//  ApiRoute.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

enum ApiRoute { case
    
    auth,
    host
    
    var path: String {
        switch self {
        case .auth: return "auth"
        case .host : return ""
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        print("\(environment.url)/\(path)")
        return "\(environment.url)/\(path)"
    }
}
