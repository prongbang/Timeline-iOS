//
//  Timeline.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//
//  let place = try? newJSONDecoder().decode(Place.self, from: jsonData)

import Foundation

// MARK: - Timeline
class Timeline: Codable {
    var id: Int = 0
    var name: String = ""
    var timestamp: Int = 0
    var location: Location = Location()
}

// MARK: - Location
class Location: Codable {
    var lat: Double = 0
    var lng: Double = 0
    var address: String = ""
}
