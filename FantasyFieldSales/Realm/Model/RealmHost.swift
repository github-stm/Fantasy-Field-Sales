//
//  RealmHost.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import RealmSwift

class RealmHost: Object, Host {
    
    convenience required public init(copy obj: Host) {
        self.init()
        name = obj.name
        url = obj.url
        icon = obj.icon
    }
    
    
    @objc dynamic var name = ""
    @objc dynamic var url = ""
    @objc dynamic var icon = ""
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
