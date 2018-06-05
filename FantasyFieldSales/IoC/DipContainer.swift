//
//  DipContainer.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Dip

class DipContainer: NSObject, IoCContainer {
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    
    private var container: DependencyContainer
    
    
    func resolve<T>() -> T {
        return try! container.resolve()
    }
    
    func resolve<T, A>(arguments arg1: A) -> T {
        return try! container.resolve(arguments: arg1)
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        return try! container.resolve(arguments: arg1, arg2)
    }
}
