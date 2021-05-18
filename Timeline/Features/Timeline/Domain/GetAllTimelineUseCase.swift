//
//  GetTimelineUseCase.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Promises

protocol GetAllTimelineUseCase {
    func execute() -> Promise<Array<Timeline>>
}

class DefaultGetAllTimelineUseCase : GetAllTimelineUseCase {
    
    private let timelineRepository: TimelineRepository
    
    init(timelineRepository: TimelineRepository) {
        self.timelineRepository = timelineRepository
    }
    
    func execute() -> Promise<Array<Timeline>> {
        return self.timelineRepository.findAll()
    }

}
