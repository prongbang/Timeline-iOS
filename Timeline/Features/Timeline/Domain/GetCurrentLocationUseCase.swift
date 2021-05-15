//
//  GetCurrentLocationUseCase.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import Promises
import SwiftLocation
import CoreLocation

protocol GetCurrentLocationUseCase {
    func execute() -> Promise<Location>
}

class DefaultGetCurrentLocationUseCase: GetCurrentLocationUseCase {
    
    private let getAddressFromPlacemarkUseCase: GetAddressFromPlacemarkUseCase
    
    init(getAddressFromPlacemarkUseCase: GetAddressFromPlacemarkUseCase) {
        self.getAddressFromPlacemarkUseCase = getAddressFromPlacemarkUseCase
    }
    
    func execute() -> Promise<Location> {
        return Promise<Location> { (resolve, reject) in
            SwiftLocation.requestAuthorization(.onlyInUse) { newStatus in
                print("Current Status is \(newStatus.description)")
                SwiftLocation.gpsLocation().then { item in
                    guard let location = item.location else {
                        reject(NSError(domain:"Location not found", code: 500) as Error)
                        return
                    }
                    
                    let currentLocation = Location()
                    currentLocation.lat = location.coordinate.latitude
                    currentLocation.lng = location.coordinate.longitude
                    
                    let latitude = location.coordinate.latitude
                    let longitude = location.coordinate.longitude
                    
                    print("latitude: \(latitude)")
                    print("longitude: \(longitude)")
                    
                    let geocoder = CLGeocoder()
                    geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
                        
                        guard let placemarks = places else {
                            resolve(currentLocation)
                            return
                        }
                        
                        currentLocation.address = self.getAddressFromPlacemarkUseCase.execute(placemarks: placemarks)
                        
                        resolve(currentLocation)
                    })
                }
            }
        }
    }
}
