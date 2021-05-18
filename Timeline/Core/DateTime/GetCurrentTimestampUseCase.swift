//
//  GetTimestampUseCase.swift
//  Timeline
//
//  Created by Endtry on 18/5/2564 BE.
//

import Foundation

protocol GetCurrentTimestampUseCase {
    func execute() -> Int
}

class GetLocalCurrentTimestampUseCase: GetCurrentTimestampUseCase {
    
    func execute() -> Int  {
        return Int(Date().timeIntervalSince1970 * 1_000)
    }
    
}
