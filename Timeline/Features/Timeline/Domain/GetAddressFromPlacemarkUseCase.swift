//
//  GetAddressFromPlace.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import CoreLocation

protocol GetAddressFromPlacemarkUseCase {
    func execute(placemarks: [CLPlacemark]?) -> String
}

class DefaultGetAddressFromPlacemarkUseCase: GetAddressFromPlacemarkUseCase {
    func execute(placemarks: [CLPlacemark]?) -> String {
        guard let placemarks = placemarks else { return ""}
        
        var addressString : String = ""
        let place = placemarks as [CLPlacemark]
        if place.count > 0 {
            let place = placemarks[0]
            if place.thoroughfare != nil {
                addressString = addressString + place.thoroughfare! + ", "
            }
            if place.subThoroughfare != nil {
                addressString = addressString + place.subThoroughfare! + ", "
            }
            if place.locality != nil {
                addressString = addressString + place.locality! + ", "
            }
            if place.postalCode != nil {
                addressString = addressString + place.postalCode! + ", "
            }
            if place.subAdministrativeArea != nil {
                addressString = addressString + place.subAdministrativeArea! + ", "
            }
            if place.country != nil {
                addressString = addressString + place.country!
            }
        }
        
        print("address: \(addressString)")
        
        return addressString
    }
}
