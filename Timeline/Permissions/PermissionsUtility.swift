//
//  PermissionsUtility.swift
//  Timeline
//
//  Created by Endtry on 21/5/2564 BE.
//

import Foundation
import CoreLocation

protocol PermissionsUtility {
    func locationEnabled() -> Bool
    func locationAllowed() -> Bool
}

class MobilePermissionsUtility: PermissionsUtility {
    private let locationManager = CLLocationManager()
    
    func locationEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func locationAllowed() -> Bool {
        switch locationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            return false
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        @unknown default:
            return false
        }
    }
}
