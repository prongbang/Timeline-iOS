//
//  Timeline.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//
//  let place = try? newJSONDecoder().decode(Place.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Timeline
class Timeline: Object {
    @objc dynamic var id: ObjectId = ObjectId.generate()
    @objc dynamic var timestamp: Int = 0
    @objc dynamic var location: Location? = Location()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func day() -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp/1_000))
        return "\(date.get(.day))"
    }
    
    func datetime() -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp/1_000))
        let day = date.get(.day)
        let month = date.get(.month)
        let year = date.get(.year)
        let hour = date.get(.hour)
        let minute = date.get(.minute)
        return "\(format(num: day)).\(format(num: month)).\(format(num: year)) \(format(num: hour)):\(format(num: minute))"
    }
    
    func address() -> String {
        return location?.address ?? ""
    }
    
    func format(num: Int) -> String {
        return num > 9 ? "\(num)" : "0\(num)"
    }
    
    func latLng() -> String {
        return "\(location?.lat ?? 0),\(location?.lng ?? 0)"
    }
}

// MARK: - Location
class Location: Object {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lng: Double = 0
    @objc dynamic var address: String = ""
}
