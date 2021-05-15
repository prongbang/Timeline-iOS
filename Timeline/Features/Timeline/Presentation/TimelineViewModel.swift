//
//  TimelineViewModel.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import Foundation
import Combine
import Resolver

class TimelineViewModel: ObservableObject, CoreViewModel {
    typealias Intent = TimelineIntent
    
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
            
            break
        }
    }
    
}
