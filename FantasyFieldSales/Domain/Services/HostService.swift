//
//  HostService.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation



typealias HostsResult = (_ hosts: [Host], _ error: Error?) -> ()

protocol HostService: class {
    
    
    func getAllHosts( completion: @escaping HostsResult)
    
}

