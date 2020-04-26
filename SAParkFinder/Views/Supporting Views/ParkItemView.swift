//
//  ParkItemView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ParkItemView: View {
    var park: Park
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            WebImage(url: URL(string: park.image))
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(park.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(park.address)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

struct ParkItemView_Previews: PreviewProvider {
    static var previews: some View {
        ParkItemView(park: parkData[0])
    }
}
