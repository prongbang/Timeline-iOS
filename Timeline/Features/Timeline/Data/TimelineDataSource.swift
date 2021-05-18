//
//  TimelineDataSource.swift
//  Timeline
//
//  Created by Endtry on 8/5/2564 BE.
//

import Foundation
import Promises

protocol TimelineDataSource {
    func add(timeline: Timeline) -> Promise<Bool>
    func findLast() -> Promise<Timeline>
    func findAll() -> Promise<Array<Timeline>>
}
