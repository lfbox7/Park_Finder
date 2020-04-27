//
//  MapViewModel.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/27/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
import CoreLocation

class MapViewModel: ObservableObject {
    @ObservedObject var locationViewModel = LocationViewModel()
    var parks: Park
    
    init(parks: Park) {
        self.parks = parks
        findDistance()
    }
    
    func findDistance() -> CLLocationDistance {
        let homeCoordinate = CLLocation(latitude: locationViewModel.currentLatitude, longitude: locationViewModel.currentLongitude)
        let parkCoordinate = CLLocation(latitude: parks.latitude, longitude: parks.longitude)
        
        let distance = homeCoordinate.distance(from: parkCoordinate) * 0.000621371
        
        return distance
    }
}
