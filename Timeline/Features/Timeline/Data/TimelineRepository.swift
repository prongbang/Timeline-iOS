//
//  TimelineRepository.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation

protocol TimelineRepository {
    
}

class DefaultTimelineRepository: TimelineRepository {
    private let timelineRemoteDataSource: TimelineDataSource
    private let timelineLocalDataSource: TimelineDataSource
    
    init(timelineRemoteDataSource: TimelineDataSource, timelineLocalDataSource: TimelineDataSource) {
        self.timelineRemoteDataSource = timelineRemoteDataSource
        self.timelineLocalDataSource = timelineLocalDataSource
    }
}
