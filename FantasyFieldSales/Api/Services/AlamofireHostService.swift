//
//  AlamofireHostService.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Alamofire

class AlamofireHostService: AlamofireService, HostService {
    
    
    
    func getAllHosts( completion: @escaping HostsResult) {
        get(at: .host).responseArray {
            (res: DataResponse<[ApiHost]>) in
            completion(res.result.value ?? [], res.result.error)
        }
    }
}
