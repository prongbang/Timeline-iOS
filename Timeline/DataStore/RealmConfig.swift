//
//  RealmConfig.swift
//  Timeline
//
//  Created by Endtry on 8/5/2564 BE.
//

import RealmSwift

class RealmConfig {
    
    static func create() -> Realm {
        let username = "prongbang"
        var config = Realm.Configuration.defaultConfiguration
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(username)
        config.fileURL!.appendPathExtension("realm")
        let realm = try! Realm(configuration: config)
        return realm
    }
}

extension Results {

    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
}

extension RealmSwift.List {

    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
}
