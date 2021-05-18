//
//  TimelineLocalDataSource.swift
//  Timeline
//
//  Created by Endtry on 8/5/2564 BE.
//

import Foundation
import RealmSwift
import Promises

class TimelineLocalDataSource: TimelineDataSource {
    
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func add(timeline: Timeline) -> Promise<Bool> {
        return Promise<Bool> { (resolve, reject) in
            do {
                try self.realm.write {
                    self.realm.add(timeline)
                }
                resolve(true)
            } catch {
                reject(NSError(domain: "Cannot save to db.", code: 500) as Error)
            }
        }
    }
    
    func findLast() -> Promise<Timeline> {
        return Promise<Timeline> { (resolve, reject) in
            let results: Results<Timeline> = self.realm.objects(Timeline.self)
            if results.count > 0 {
                let timelines: [Timeline] = results.toArray()
                if timelines.count > 0 {
                    resolve(timelines[0])
                    return
                }
            }
            reject(NSError(domain: "Not found timeline lasted.", code: 404) as Error)
        }
    }
    
    func findAll() -> Promise<Array<Timeline>> {
        return Promise<Array<Timeline>> { (resolve, reject) in
            let results: Results<Timeline> = self.realm.objects(Timeline.self)
            if results.count > 0 {
                let timelines: [Timeline] = results.toArray()
                resolve(timelines)
            } else {
                resolve([])
            }
        }
    }
    
}
