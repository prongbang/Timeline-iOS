//
//  GetTimelineUseCase.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Promises

protocol GetTimelineUseCase {
    func execute(params: Unit) -> Promise<Timeline>
}

class DefaultGetTimelineUseCase : GetTimelineUseCase {
    
    private let timelineRepository: TimelineRepository
    
    init(timelineRepository: TimelineRepository) {
        self.timelineRepository = timelineRepository
    }
    
    func execute(params: Unit) -> Promise<Timeline> {
        return Promise<Timeline> { (resolve, reject) in
            
        }
    }

}
