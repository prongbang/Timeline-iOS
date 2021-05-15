//
//  UseCase.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation

/**
 * protocol MyUseCase: UseCase where Param == Int, Result == Promise<Holiday> {}
 */
protocol UseCase {
    associatedtype Param
    associatedtype Result
    
    func execute(params: Param) -> Result
}
