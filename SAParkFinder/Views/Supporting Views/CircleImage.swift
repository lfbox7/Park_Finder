//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    var park: Park

    var body: some View {
        WebImage(url: URL(string: park.image))
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(park: parkData[0])
    }
}
