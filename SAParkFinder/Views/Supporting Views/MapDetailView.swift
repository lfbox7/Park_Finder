//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapDetailView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapDetailView_Previews: PreviewProvider {
    var park: Park
    static var previews: some View {
        MapDetailView(coordinate: CLLocationCoordinate2D(
            latitude: parkData[0].latitude, longitude: parkData[0].longitude))
    }
}

