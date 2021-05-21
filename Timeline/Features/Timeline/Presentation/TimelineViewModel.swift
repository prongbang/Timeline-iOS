//
//  TimelineViewModel.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Combine
import Resolver
import SwiftLocation
import CoreLocation

class TimelineViewModel: ObservableObject, CoreViewModel {
    typealias Intent = TimelineIntent
    
    @Injected var getCurrentLocationUseCase: GetCurrentLocationUseCase
    @Injected var addTimelineUseCase: AddTimelineUseCase
    @Injected var getTimelineLastUseCase: GetTimelineLastUseCase
    @Injected var permissionsUtility: PermissionsUtility
    
    @Published var state: TimelineState = .Init
    @Published var effect: TimelineEffect = .Init
    @Published var location: LocationState = .Init
    @Published var currentDate: String = Timeline().datetime()
    
    func process(intent: TimelineIntent) {
        if case intent = TimelineIntent.GetTimelineLast {
            processGetTimelineLast()
        } else if case intent = TimelineIntent.AddTimeline {
            processAddTimeline()
        } else if case intent = TimelineIntent.GetCurrentLocation {
            processGetCurrentLocation()
        }
    }
    
    func processAddTimeline() {
        self.state = .Loading
        
        self.getCurrentLocationUseCase.execute().then { location in
            print("location: \(location.address)")
            let timeline = Timeline()
            timeline.location = location
            self.addTimelineUseCase.execute(params: timeline).then { result in
                self.processGetTimelineLast()
            }.catch { e in
                print(e)
                self.effect = .Error
                self.processGetTimelineLast()
            }
        }.catch{ (error) in
            print(error)
            self.effect = .Error
            self.processGetTimelineLast()
        }
    }
    
    func processGetTimelineLast() {
        self.getTimelineLastUseCase.execute().then { timeline in
            self.state = .TimelineLast(timeline)
        }.catch { e in
            print(e)
            self.effect = .Error
        }
    }
    
    func processGetCurrentLocation() {
        if !self.permissionsUtility.locationEnabled() {
            self.location = .LocationDisabled
            return
        }
        
        if self.permissionsUtility.locationAllowed() {
            self.getCurrentLocationUseCase.execute().then { location in
                self.location = .CurrentLocation(location)
            }.catch { e in
                self.location = .Error
            }
        } else {
            self.location = .LocationNotAllow
        }
    }
}
