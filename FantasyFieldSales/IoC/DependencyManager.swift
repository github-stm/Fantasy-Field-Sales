//
//  DependencyManager.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Dip
import Alamofire

class DependencyManager: NSObject {
    
    static func registerDependencies() {
        let dip = DependencyContainer()
        registerApi(dip)
        let container = DipContainer(container: dip)
        IoC.register(container)
        setupApi()
    }
    
    
    fileprivate static func registerApi(_ dip: DependencyContainer) {
        dip.register(.singleton) {
            NonPersistentApiContext(environment: .production) as ApiContext
        }
        /*
         dip.register {
         AlamofireAuthService(context: $0) as AuthService
         }
         */
        dip.register {
            //  RealmMovieService(baseService: AlamofireMovieService(context: $0)) as MovieService
            
            RealmHostService(baseService: AlamofireHostService(context: $0)) as HostService
        }
    }
    
    fileprivate static func setupApi() {
        let manager = SessionManager.default
        manager.adapter = ApiRequestAdapter(context: IoC.resolve())
        // manager.retrier = ApiRequestRetrier(context: IoC.resolve(), authService: IoC.resolve())
    }
}
