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
    
    @Published var state: TimelineState = .Init
    
    func process(intent: TimelineIntent) {
        switch intent {
        case TimelineIntent.GetTimeline:
            self.state = .Loading
            var timelines: [Timeline] = []
            timelines.append(Timeline())
            self.state = .Success(timelines)
            break
        case TimelineIntent.AddTimeline:
            self.state = .Loading
            
            self.getCurrentLocationUseCase.execute().then { location in
                print("location: \(location.address)")
            }.catch{ (error) in
                self.state = .Error("")
            }
            break
        }
    }
    
}
