//
//  TimelineRemoteDataSource.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import Promises

class TimelineRemoteDataSource: TimelineDataSource {
    
    func add(timeline: Timeline) -> Promise<Bool> {
        return Promise<Bool> { (resolve, reject) in
            resolve(false)
        }
    }
    
    func findLast() -> Promise<Timeline> {
        return Promise<Timeline> { (resolve, reject) in
            
        }
    }
    
    func findAll() -> Promise<Array<Timeline>> {
        return Promise<Array<Timeline>> { (resolve, reject) in
            resolve([])
        }
    }
}
