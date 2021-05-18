//
//  TimelineListState.swift
//  Timeline
//
//  Created by Endtry on 18/5/2564 BE.
//

enum TimelineListState {
    case Init
    case Loading
    case TimelineList([Timeline])
    case Error(String)
}
