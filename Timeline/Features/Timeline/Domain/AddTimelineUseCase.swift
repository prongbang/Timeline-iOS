//
//  AddTimelineUseCase.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Promises

protocol AddTimelineUseCase {
    func execute(params: Timeline) -> Promise<Bool>
}

struct DefaultAddTimelineUseCase: AddTimelineUseCase {
    
    private let getLocalCurrentTimestampUseCase: GetCurrentTimestampUseCase
    private let timelineRepository: TimelineRepository
    
    init(timelineRepository: TimelineRepository, getLocalCurrentTimestampUseCase: GetCurrentTimestampUseCase) {
        self.timelineRepository = timelineRepository
        self.getLocalCurrentTimestampUseCase = getLocalCurrentTimestampUseCase
    }
    
    func execute(params: Timeline) -> Promise<Bool> {
        params.timestamp = getLocalCurrentTimestampUseCase.execute()
        return self.timelineRepository.add(timeline: params)
    }
}
