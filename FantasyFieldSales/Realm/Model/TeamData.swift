//
//  TeamGroup.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 21/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation
import RealmSwift

class TeamData: Object {

    @objc dynamic var id = 0
    @objc dynamic var position = 0
    @objc dynamic var name = ""
    @objc dynamic var points = 0
    @objc dynamic var image = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}



