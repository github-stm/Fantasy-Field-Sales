//
//  IoC.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

public final class IoC {
    
    // Inversion of control
    
    private static var _container: IoCContainer!
    
    public static var container: IoCContainer {
        return _container
    }
    
    public static func register(_ container: IoCContainer) {
        _container = container
    }
    
    public static func resolve<T>() -> T {
        return _container.resolve()
    }
    
    public static func resolve<T, A>(arguments arg1: A) -> T {
        return _container.resolve(arguments: arg1)
    }
    
    public static func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        return _container.resolve(arguments: arg1, arg2)
    }
}
