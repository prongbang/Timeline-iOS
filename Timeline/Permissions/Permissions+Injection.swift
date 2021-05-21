//
//  Permissions+Injection.swift
//  Timeline
//
//  Created by Endtry on 21/5/2564 BE.
//


import Resolver

extension Resolver {
    
    public static func registerPermissions() {
        register { MobilePermissionsUtility() as PermissionsUtility }
    }
}
