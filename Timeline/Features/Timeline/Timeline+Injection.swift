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
        register(name: "TimelineLocalDataSource") { TimelineLocalDataSource(realm: resolve()) as TimelineDataSource }
        register(name: "TimelineRemoteDataSource") { TimelineRemoteDataSource() as TimelineDataSource }
        register{
            DefaultTimelineRepository(
                timelineRemoteDataSource: resolve(name: "TimelineRemoteDataSource"),
                timelineLocalDataSource: resolve(name: "TimelineLocalDataSource")
            ) as TimelineRepository
        }
        register{
            DefaultAddTimelineUseCase(
                timelineRepository: resolve(),
                getLocalCurrentTimestampUseCase: resolve()
            ) as AddTimelineUseCase
        }
        register{ DefaultGetAllTimelineUseCase(timelineRepository: resolve()) as GetAllTimelineUseCase }
        register {DefaultGetTimelineLastUseCase(timelineRepository: resolve()) as GetTimelineLastUseCase}
        register{ DefaultGetAddressFromPlacemarkUseCase() as GetAddressFromPlacemarkUseCase }
        register{ DefaultGetCurrentLocationUseCase(getAddressFromPlacemarkUseCase: resolve()) as GetCurrentLocationUseCase }
    }
}
