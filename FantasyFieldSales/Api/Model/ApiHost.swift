//
//  ApiHost.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import ObjectMapper

class ApiHost: Host, Mappable  {
    
    required public init?(map: Map) {}
    
    
    var name = ""
    var url = ""
    var icon = ""
    
    
    func mapping(map: Map) {
        
        name <- map["name"]
        url <- map["url"]
        icon <- map["icon"]
    }
    
}
