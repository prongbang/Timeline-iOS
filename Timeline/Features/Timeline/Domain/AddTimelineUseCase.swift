//
//  AddTimelineUseCase.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Promises

protocol AddTimelineUseCase {
    func execute(params: Unit) -> Promise<Bool>
}

struct DefaultAddTimelineUseCase: AddTimelineUseCase {
    
    private let timelineRepository: TimelineRepository
    
    init(timelineRepository: TimelineRepository) {
        self.timelineRepository = timelineRepository
    }
    
    func execute(params: Unit) -> Promise<Bool> {
        return Promise<Bool> { (resolve, reject) in
            
        }
    }
}
