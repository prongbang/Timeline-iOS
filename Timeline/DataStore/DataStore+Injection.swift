//
//  DataStore+Injection.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Resolver

extension Resolver {
    
    public static func registerDataStore() {
        register { RealmConfig.create() }
    }
}
