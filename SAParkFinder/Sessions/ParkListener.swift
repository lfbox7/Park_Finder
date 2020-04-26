//
//  ParkListener.swift
//  SAParkFinder
//
//  Created by Leonard Box on 4/19/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import Foundation
import Firebase

class ParkListener: ObservableObject {
    @Published var showFeaturedOnly = false
    @Published var parks: [Park] = []
    
    init() {
        downloadParks()
    }
    
    func downloadParks() {
        FirebaseReference(.Parks).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            if !snapshot.isEmpty {
                self.parks = ParkListener.parkFromDictionary(snapshot)
            }
        }
    }
    
    static func parkFromDictionary(_ snapshot: QuerySnapshot) -> [Park] {
        var allParks: [Park] = []
        
        for snapshot in snapshot.documents {
            let parkData = snapshot.data()
            allParks.append(Park(id: parkData[kID] as? String ?? UUID().uuidString,
                                 featured: parkData[kFEATURED] as? Bool ?? false,
                                 parkType: Category(rawValue: parkData[kPARKTYPE] as? String ?? "national") ?? .national,
                                 parkID: parkData[kPARKID] as? Int ?? 00,
                                 name: parkData[kNAME] as? String ?? "Unknown",
                                 address: parkData[kADDRESS] as? String ?? "Unknown",
                                 city: parkData[kCITY] as? String ?? "Unknown",
                                 state: parkData[kSTATE] as? String ?? "Unknown",
                                 zip: parkData[kZIP] as? Int ?? 00000,
                                 link: parkData[kLINK] as? String ?? "Unknown",
                                 description: parkData[kDESCRIPTION] as? String ?? "Unknown",
                                 image: parkData[kIMAGE] as? String ?? "Unknown",
                                 longitude: parkData[kLONGITUDE] as? Double ?? 0.0,
                                 latitude: parkData[kLATITUDE] as? Double ?? 0.0,
                                 hasRestrooms: parkData[kHASRESTROOMS] as? Bool ?? false,
                                 hasWater: parkData[kHASWATER] as? Bool ?? false,
                                 hasCommunityCenter: parkData[kHASCOMMUNITYCENTER] as? Bool ?? false,
                                 hasPavilion: parkData[kHASPAVILION] as? Bool ?? false,
                                 hasTables: parkData[kHASTABLES] as? Bool ?? false,
                                 hasGrill: parkData[kHASGRILL] as? Bool ?? false,
                                 hasBikeRack: parkData[kHASBIKERACK] as? Bool ?? false,
                                 hasBikeRepair: parkData[kHASBIKEREPAIR] as? Bool ?? false,
                                 hasPlayground: parkData[kHASPLAYGROUND] as? Bool ?? false,
                                 hasDogPark: parkData[kHASDOGPARK] as? Bool ?? false,
                                 hasBaseball: parkData[kHASBASEBALL] as? Bool ?? false,
                                 hasBasketball: parkData[kHASBASKETBALL] as? Bool ?? false,
                                 hasBikePark: parkData[kHASBIKEPARK] as? Bool ?? false,
                                 hasDiscGolf: parkData[kHASDISCGOLF] as? Bool ?? false,
                                 hasFitness: parkData[kHASFITNESS] as? Bool ?? false,
                                 hasHandball: parkData[kHASHANDBALL] as? Bool ?? false,
                                 hasMultiPurpose: parkData[kHASMULTIPURPOSE] as? Bool ?? false,
                                 hasPickleball: parkData[kHASPICKLEBALL] as? Bool ?? false,
                                 hasPool: parkData[kHASPOOL] as? Bool ?? false,
                                 hasSkatePark: parkData[kHASSKATEPARK] as? Bool ?? false,
                                 hasSoccer: parkData[kHASSOCCER] as? Bool ?? false,
                                 hasSoftball: parkData[kHASSOFTBALL] as? Bool ?? false,
                                 hasSplashpad: parkData[kHASSPLASHPAD] as? Bool ?? false,
                                 hasTennis: parkData[kHASTENNIS] as? Bool ?? false,
                                 hasVolleyball: parkData[kHASVOLLEYBALL] as? Bool ?? false,
                                 hasTrail: parkData[kHASTRAIL] as? Bool ?? false,
                                 trailSurface: parkData[kTRAILSURFACE] as? String ?? "Unknown",
                                 trailLength: parkData[kTRAILLENGTH] as? Double ?? 0.0
            ))
        }
        return allParks
    }
}
