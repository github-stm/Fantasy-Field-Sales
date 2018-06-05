//
//  IoCContainer.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 05/06/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import Foundation

public protocol IoCContainer {
    
    func resolve<T>() -> T
    func resolve<T, A>(arguments arg1: A) -> T
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T
}
