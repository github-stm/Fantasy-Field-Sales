//
//  RealmHostService.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import RealmSwift

class RealmHostService: HostService {
    
    init(baseService: HostService) {
        self.baseService = baseService
    }
    
    
    fileprivate let baseService: HostService
    fileprivate var realm: Realm { return try! Realm() }
    
    
    func getAllHosts( completion: @escaping HostsResult){
        getHostFromDb(completion: completion)
        getHostFromService(completion: completion)
    }
    
    
    fileprivate func getHostFromDb(completion: @escaping HostsResult) {
        let objs = realm.objects(RealmHost.self)
        let sorted = objs.sorted { $0.name > $1.name }
        
        print("Realm Database \(Realm.Configuration.defaultConfiguration.fileURL!)")
        completion(Array(sorted), nil)
    }
    
    fileprivate func getHostFromService(completion: @escaping HostsResult) {
        baseService.getAllHosts() { (hosts, error) in
            self.persist(hosts)
            completion(hosts, error)
        }
    }
    
    
    fileprivate func persist(_ host: Host?) {
        guard let host = host else { return }
        persist([host])
    }
    
    fileprivate func persist(_ hosts: [Host]) {
        let objs = hosts.map { RealmHost(copy: $0) }
        try! realm.write {
            realm.add(objs, update: true)
        }
    }
}
