//
//  App+Injection.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerTimeline()
        registerDataStore()
    }
}
