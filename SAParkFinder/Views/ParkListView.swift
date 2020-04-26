//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//
import SwiftUI

struct ParkListView: View {
    @ObservedObject private var parkListener = ParkListener()
    
    var body: some View {
        List {
            Toggle(isOn: $parkListener.showFeaturedOnly) {
                Text("Show Featured Only")
            }
            
            ForEach(parkListener.parks) { park in
                if !self.parkListener.showFeaturedOnly || park.featured {
                    NavigationLink(
                        destination: ParkDetailView(park: park)
                            .environmentObject(self.parkListener)
                    ) {
                        ParkListRowView(park: park)
                    }
                }
            }
            .navigationBarTitle(Text("Parks"), displayMode: .inline)
        }
    }
}

/*
struct ParkListView_Previews: PreviewProvider {
    static var previews: some View {
        ParkListView()
    }
}
*/
