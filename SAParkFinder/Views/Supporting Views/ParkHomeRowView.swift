//
//  ParkHomeRowView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI

struct ParkHomeRowView: View {
    var categoryName: String
    var parks: [Park]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.parks) { park in
                        NavigationLink(destination: ParkDetailView(park: park)) {
                            ParkItemView(park: park)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                    }
                }
            }
        }
    }
}

struct ParkHomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        ParkHomeRowView(categoryName: "City Parks", parks: parkData)
    }
}
