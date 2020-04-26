//
//  DirectionsView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/26/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct DirectionsMapView: View {
    var coordinate: CLLocationCoordinate2D
    var name: String
    
    var body: some View {
        DirectionsView(coordinate: coordinate, name: name)
    }
}


struct DirectionsView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return DirectionsView.Coordinator()
    }
    
    var coordinate: CLLocationCoordinate2D
    var name: String
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: UIViewRepresentableContext<DirectionsView>) -> MKMapView {
        let map = MKMapView()
        let homeCoordinate = CLLocationCoordinate2D(latitude: locationManager.lastLocation?.coordinate.latitude ?? 0, longitude: locationManager.lastLocation?.coordinate.longitude ?? 0)
        let destinationCoordinate = coordinate
        
        
        let region = MKCoordinateRegion(center: homeCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = homeCoordinate
        sourcePin.title = "Home"
        map.addAnnotation(sourcePin)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destinationCoordinate
        destinationPin.title = name
        map.addAnnotation(destinationPin)
        
        map.region = region
        map.delegate = context.coordinator
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: homeCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        
        let directions = MKDirections(request: req)
        directions.calculate { (direct, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
        }
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<DirectionsView>) {
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .blue
            render.lineWidth = 4
            return render
        }
    }
}
