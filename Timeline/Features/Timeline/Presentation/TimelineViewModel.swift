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
    
    @Published var state: TimelineState = .Init
    @Published var effect: TimelineEffect = .Init
    
    func process(intent: TimelineIntent) {
        switch intent {
        case TimelineIntent.GetTimelineLast:
            processGetTimelineLast()
            break
        case TimelineIntent.AddTimeline:
            processAddTimeline()
            break
        case .GetCurrentLocation:
            
            break
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
}
