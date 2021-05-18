//
//  TimelineListViewModel.swift
//  Timeline
//
//  Created by Endtry on 18/5/2564 BE.
//

import Foundation
import Resolver

class TimelineListViewModel: ObservableObject, CoreViewModel {
    typealias Intent = TimelineListIntent
    
    @Injected var getAllTimelineUseCase: GetAllTimelineUseCase
    
    @Published var state: TimelineListState = .Init
    
    func process(intent: TimelineListIntent) {
        switch intent {
        case TimelineListIntent.GetTimelineList:
            processGetAllTimeline()
            break
        }
    }
    
    func processGetAllTimeline() {
        self.state = .Loading
        self.getAllTimelineUseCase.execute().then { timelines in
            self.state = .TimelineList(timelines)
        }.catch { e in
            print(e)
            self.state = .Error(e.localizedDescription)
        }
    }
}
