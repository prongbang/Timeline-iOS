//
//  GetTimelineLastUseCase.swift
//  Timeline
//
//  Created by Endtry on 18/5/2564 BE.
//

import Promises

protocol GetTimelineLastUseCase {
    func execute() -> Promise<Timeline>
}

class DefaultGetTimelineLastUseCase: GetTimelineLastUseCase {
    private let timelineRepository: TimelineRepository
    
    init(timelineRepository: TimelineRepository) {
        self.timelineRepository = timelineRepository
    }
    
    func execute() -> Promise<Timeline> {
        return self.timelineRepository.findLast()
    }
}
