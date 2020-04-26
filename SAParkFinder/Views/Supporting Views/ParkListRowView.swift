//
//  ParkListRowView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/25/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import MapKit
import SDWebImageSwiftUI

struct ParkListRowView: View {
    var park: Park
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: park.image))
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .shadow(radius: 10)
            Text(park.name)
            Spacer()
        }
    }
}

struct ParkListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ParkListRowView(park: parkData[0])
    }
}

