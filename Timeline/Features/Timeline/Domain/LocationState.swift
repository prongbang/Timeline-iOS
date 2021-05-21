//
//  LocationState.swift
//  Timeline
//
//  Created by Endtry on 21/5/2564 BE.
//

import Foundation

enum LocationState {
    case Init
    case CurrentLocation(Location)
    case LocationNotAllow
    case LocationDisabled
    case Error
}
