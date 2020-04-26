//
//  HomeView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/18/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var parkListener = ParkListener()
    var categories: [String : [Park]] {
        .init(
            grouping: parkListener.parks,
            by: {$0.parkType.rawValue}
        )
    }
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(), id: \String.self) { key in
                ParkHomeRowView(categoryName: "\(key) Parks".uppercased(), parks: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .navigationBarTitle(Text("SA Parks Finder"))
            .navigationBarItems(leading:
                Button(action: {
                    //code
                    print("logout")
                }, label: {
                    Text("Logout")
                })
                , trailing:
                NavigationLink(destination: ParkListView()) {
                    Text("List")
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

