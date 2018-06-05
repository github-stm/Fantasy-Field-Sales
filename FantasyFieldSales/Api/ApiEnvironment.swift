//
//  ApiEnvironment.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case
    
    //  production = "http://danielsaidi.com/AlamofireRealmDemo/api/"
    
    production = "https://gist.githubusercontent.com/anonymous/290132e587b77155eebe44630fcd12cb/raw/777e85227d0c1c16e466475bb438e0807900155c/sk_hosts"
    var url: String {
        return rawValue
    }
}
