//
//  TimelineRepository.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import Promises

protocol TimelineRepository {
    func add(timeline: Timeline) -> Promise<Bool>
    func findLast() -> Promise<Timeline>
    func findAll() -> Promise<Array<Timeline>>
}

class DefaultTimelineRepository: TimelineRepository {

    private let timelineRemoteDataSource: TimelineDataSource
    private let timelineLocalDataSource: TimelineDataSource
    
    init(timelineRemoteDataSource: TimelineDataSource, timelineLocalDataSource: TimelineDataSource) {
        self.timelineRemoteDataSource = timelineRemoteDataSource
        self.timelineLocalDataSource = timelineLocalDataSource
    }
    
    func add(timeline: Timeline) -> Promise<Bool> {
        return self.timelineLocalDataSource.add(timeline: timeline)
    }
    
    func findLast() -> Promise<Timeline> {
        return self.timelineLocalDataSource.findLast()
    }
    
    func findAll() -> Promise<Array<Timeline>> {
        return self.timelineLocalDataSource.findAll()
    }
    
}
