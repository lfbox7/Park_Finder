//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct ParkDetailView: View {
    var park: Park
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: park.latitude,
            longitude: park.longitude)
    }
    
    var body: some View {
        VStack {
            MapDetailView(coordinate: coordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImage(park: park)
                .offset(x: 0, y: -150)
                .padding(.bottom, -150)
            VStack(alignment: .leading) {
                Text(park.name)
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(park.address)
                                .font(.subheadline)
                        }
                        HStack {
                            Text("\(park.city), \(park.state) \(park.zip)")
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Latitude: \(park.latitude, specifier: "%.5f")")
                                .font(.subheadline)
                        }
                        HStack {
                            Text("Longitude: \(park.longitude, specifier: "%.5f")")
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.bottom)
                HStack {
                    Spacer()
                    NavigationLink(destination: DirectionsView(coordinate: coordinate, name: park.name)) {
                        Text("Get Directions")
                            
                            .foregroundColor(.blue)
                        
                        
                    }
                    Spacer()
                }
                .padding(.bottom)
                HStack {
                    Text("Description:")
                        .bold()
                        .underline()
                }
                HStack {
                    GeometryReader { geometry in
                        ScrollView {
                            Text(self.park.description)
                                .frame(width: geometry.size.width)
                        }
                    }
                }
                List {
                    HStack {
                        Text("Amenities:")
                            .bold()
                            .underline()
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasRestrooms == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Restrooms")
                                Spacer()
                                if(park.hasWater == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Water")
                            }
                            HStack {
                                if(park.hasCommunityCenter == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Community Center")
                                Spacer()
                                if(park.hasPavilion == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pavilion")
                            }
                            HStack {
                                if(park.hasTables == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Tables")
                                Spacer()
                                if(park.hasGrill == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Grill")
                            }
                            HStack {
                                if(park.hasBikeRack == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Bike Rack")
                                Spacer()
                                if(park.hasBikeRepair == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Repair Station")
                            }
                            HStack {
                                if(park.hasPlayground == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Playground")
                                Spacer()
                                if(park.hasDogPark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Dog Park")
                            }
                        }
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasTrail == true) {
                                    Image(systemName: "checkmark.square")
                                    Text(" Trail:    Surface: \(park.trailSurface)     Length: \(park.trailLength, specifier: "%.2f")")
                                } else {
                                    Image(systemName: "square")
                                    Text(" Trail")
                                }
                            }
                        }
                    }
                    Section {
                        VStack {
                            HStack {
                                if(park.hasBaseball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Baseball")
                                Spacer()
                                if(park.hasBasketball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Basketball")
                            }
                            HStack {
                                if(park.hasBikePark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Bike Park")
                                Spacer()
                                if(park.hasDiscGolf == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Disc Golf")
                            }
                            HStack {
                                if(park.hasFitness == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Fitness Equipment")
                                Spacer()
                                if(park.hasHandball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Handball")
                            }
                            HStack {
                                if(park.hasMultiPurpose == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Multi-Purpose Field")
                                Spacer()
                                if(park.hasPickleball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pickleball")
                            }
                            HStack {
                                if(park.hasPool == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Pool")
                                Spacer()
                                if(park.hasSkatePark == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Skate Park")
                            }
                            HStack {
                                if(park.hasSoccer == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Soccer")
                                Spacer()
                                if(park.hasSoftball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Softball")
                            }
                            HStack {
                                if(park.hasTennis == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Tennis")
                                Spacer()
                                if(park.hasVolleyball == true) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                                Text(" Volleyball")
                            }
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct ParkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetailView(park: parkData[0])
    }
}

