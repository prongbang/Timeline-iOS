//
//  Core+Injection.swift
//  Timeline
//
//  Created by Endtry on 18/5/2564 BE.
//

import Resolver

extension Resolver {
    
    public static func registerCore() {
        register { GetLocalCurrentTimestampUseCase() as GetCurrentTimestampUseCase }
    }

}
