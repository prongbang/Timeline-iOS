//
//  Timeline+Injection.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Resolver

extension Resolver {
    
    public static func registerTimeline() {
        // register{ MoyaProvider<HolidayService>() }
        register(name: "TimelineLocalDataSource") { TimelineLocalDataSource() as TimelineDataSource }
        register(name: "TimelineRemoteDataSource") { TimelineRemoteDataSource() as TimelineDataSource }
        register{
            DefaultTimelineRepository(
                timelineRemoteDataSource: resolve(name: "TimelineRemoteDataSource"),
                timelineLocalDataSource: resolve(name: "TimelineLocalDataSource")
            ) as TimelineRepository
        }
        register{ DefaultAddTimelineUseCase(timelineRepository: resolve()) as AddTimelineUseCase }
        register{ DefaultGetTimelineUseCase(timelineRepository: resolve()) as GetTimelineUseCase }
    }
}
