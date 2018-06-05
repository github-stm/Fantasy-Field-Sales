//
//  ApiContext.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

protocol ApiContext: class {
    
    var authToken: String? { get set }
    var environment: ApiEnvironment { get set }
}
