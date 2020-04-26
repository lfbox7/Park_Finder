//
//  Park.swift
//  SAParkFinder
//
//  Created by Leonard Box on 2/11/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import SwiftUI
import Firebase

enum Category: String, CaseIterable, Codable, Hashable {
    case city
    case county
    case sara
    case state
    case national
    case trailhead
    case greenway
}

struct Park: Identifiable, Hashable {
    var id: String
    var featured: Bool
    var parkType: Category
    var parkID: Int
    var name: String
    var address: String
    var city: String
    var state: String
    var zip: Int
    var link: String
    var description: String
    var image: String
    var longitude: Double
    var latitude: Double
    var hasRestrooms: Bool
    var hasWater: Bool
    var hasCommunityCenter: Bool
    var hasPavilion: Bool
    var hasTables: Bool
    var hasGrill: Bool
    var hasBikeRack: Bool
    var hasBikeRepair: Bool
    var hasPlayground: Bool
    var hasDogPark: Bool
    var hasBaseball: Bool
    var hasBasketball: Bool
    var hasBikePark: Bool
    var hasDiscGolf: Bool
    var hasFitness: Bool
    var hasHandball: Bool
    var hasMultiPurpose: Bool
    var hasPickleball: Bool
    var hasPool: Bool
    var hasSkatePark: Bool
    var hasSoccer: Bool
    var hasSoftball: Bool
    var hasSplashpad: Bool
    var hasTennis: Bool
    var hasVolleyball: Bool
    var hasTrail: Bool
    var trailSurface: String
    var trailLength: Double
}

func parkDictionaryFrom(park: Park) -> [String : Any] {
    return NSDictionary(objects: [park.id,
                                  park.featured,
                                  park.parkType.rawValue,
                                  park.parkID,
                                  park.name,
                                  park.address,
                                  park.city,
                                  park.state,
                                  park.zip,
                                  park.link,
                                  park.description,
                                  park.image,
                                  park.longitude,
                                  park.latitude,
                                  park.hasRestrooms,
                                  park.hasWater,
                                  park.hasCommunityCenter,
                                  park.hasPavilion,
                                  park.hasTables,
                                  park.hasGrill,
                                  park.hasBikeRack,
                                  park.hasBikeRepair,
                                  park.hasPlayground,
                                  park.hasDogPark,
                                  park.hasBaseball,
                                  park.hasBasketball,
                                  park.hasBikePark,
                                  park.hasDiscGolf,
                                  park.hasFitness,
                                  park.hasHandball,
                                  park.hasMultiPurpose,
                                  park.hasPickleball,
                                  park.hasPool,
                                  park.hasSkatePark,
                                  park.hasSoccer,
                                  park.hasSoftball,
                                  park.hasSplashpad,
                                  park.hasTennis,
                                  park.hasVolleyball,
                                  park.hasTrail,
                                  park.trailSurface,
                                  park.trailLength
                                ],
                        forKeys: [
                            kID as NSCopying,
                            kFEATURED as NSCopying,
                            kPARKTYPE as NSCopying,
                            kPARKID as NSCopying,
                            kNAME as NSCopying,
                            kADDRESS as NSCopying,
                            kCITY as NSCopying,
                            kSTATE as NSCopying,
                            kZIP as NSCopying,
                            kLINK as NSCopying,
                            kLONGITUDE as NSCopying,
                            kLATITUDE as NSCopying,
                            kDESCRIPTION as NSCopying,
                            kIMAGE as NSCopying,
                            kHASRESTROOMS as NSCopying,
                            kHASWATER as NSCopying,
                            kHASCOMMUNITYCENTER as NSCopying,
                            kHASPAVILION as NSCopying,
                            kHASTABLES as NSCopying,
                            kHASGRILL as NSCopying,
                            kHASBIKERACK as NSCopying,
                            kHASBIKEREPAIR as NSCopying,
                            kHASPLAYGROUND as NSCopying,
                            kHASDOGPARK as NSCopying,
                            kHASBASEBALL as NSCopying,
                            kHASBASKETBALL as NSCopying,
                            kHASBIKEPARK as NSCopying,
                            kHASDISCGOLF as NSCopying,
                            kHASFITNESS as NSCopying,
                            kHASHANDBALL as NSCopying,
                            kHASMULTIPURPOSE as NSCopying,
                            kHASPICKLEBALL as NSCopying,
                            kHASPOOL as NSCopying,
                            kHASSKATEPARK as NSCopying,
                            kHASSOCCER as NSCopying,
                            kHASSOFTBALL as NSCopying,
                            kHASSPLASHPAD as NSCopying,
                            kHASTENNIS as NSCopying,
                            kHASVOLLEYBALL as NSCopying,
                            kHASTRAIL as NSCopying,
                            kTRAILSURFACE as NSCopying,
                            kTRAILLENGTH as NSCopying
    ]) as! [String : Any]
}

func createParks() {
    for park in parkData {
        FirebaseReference(.Parks).addDocument(data: parkDictionaryFrom(park: park))
    }
}

let parkData = [
    Park(id: UUID().uuidString, featured: false, parkType: Category.national, parkID: 156, name: "Mission Concepción", address: "807 Mission Road", city: "San Antonio", state: "TX", zip: 78210, link: "https://www.nps.gov/saan/planyourvisit/concepcion.htm", description: "Dedicated in 1755, Mission Concepción appears very much as it did over two centuries ago. It stands proudly as the oldest unrestored stone church in America. In its heyday, colorful geometric designs covered its surface, but the patterns have long since faded or been worn away. However, original frescos are still visible in several of the rooms. ", image: "https://www.nps.gov/saan/planyourvisit/images/Concepcion_Church7_2017.jpg?maxwidth=1200&autorotate=false", longitude: -98.49210, latitude: 29.39227, hasRestrooms: true, hasWater: true, hasCommunityCenter: false, hasPavilion: false, hasTables: false, hasGrill: false, hasBikeRack: true, hasBikeRepair: false, hasPlayground: false, hasDogPark: false, hasBaseball: false, hasBasketball: false, hasBikePark: false, hasDiscGolf: false, hasFitness: false, hasHandball: false, hasMultiPurpose: false, hasPickleball: false, hasPool: false, hasSkatePark: false, hasSoccer: false, hasSoftball: false, hasSplashpad: false, hasTennis: false, hasVolleyball: false, hasTrail: false, trailSurface: "", trailLength: 0.0),
    
    Park(id: UUID().uuidString, featured: false, parkType: Category.state, parkID: 25, name: "Government Canyon State Natural Area", address: "12861 Galm Road", city: "San Antonio", state: "TX", zip: 78254, link: "https://tpwd.texas.gov/state-parks/government-canyon", description: "Government Canyon State Natural Area offers more than 40 miles of trails. You can also camp, attend a program or guided hike, geocache, picnic, take nature photos, and look for birds and other wildlife. Your kids will connect with “natural fun” at our playscape and Discovery Trail.", image: "https://data.rec1.com/customer_images/1914/93c1c6cbc86e41d0bd51335d70a9b479.jpg", longitude: -98.764715, latitude: 29.549316, hasRestrooms: true, hasWater: true, hasCommunityCenter: true, hasPavilion: true, hasTables: true, hasGrill: true, hasBikeRack: false, hasBikeRepair: false, hasPlayground: true, hasDogPark: false, hasBaseball: false, hasBasketball: false, hasBikePark: false, hasDiscGolf: false, hasFitness: false, hasHandball: false, hasMultiPurpose: false, hasPickleball: false, hasPool: false, hasSkatePark: false, hasSoccer: false, hasSoftball: false, hasSplashpad: false, hasTennis: false, hasVolleyball: false, hasTrail: true, trailSurface: "Natural", trailLength: 38.48),
    
    Park(id: UUID().uuidString, featured: false, parkType: Category.county, parkID: 393, name: "Hot Wells Park", address: "5503 South Presa Street Street", city: "San Antonio", state: "TX", zip: 78237, link: "https://www.bexar.org/3057/Hot-Wells-of-Bexar-County", description: "Hot Wells of Bexar County is the county’s newest park located in Precinct 1 at 5503 S. Presa St., along the Mission Reach of the San Antonio River. In 2015, Bexar County acquired the ruins and surrounding land for preservation and public use. Since then, Bexar County has transformed the Hot Wells ruins into a world-class, model for urban restoration and community engagement – now perfectly complementing the Mission Reach Trails and Texas’ only UNESCO World Heritage Site, the San Antonio Missions.", image: "https://www.sanantonio.gov/Portals/0/EasyGalleryImages/50/1253/IMG_8152.JPG", longitude: -98.470070, latitude: 29.364960, hasRestrooms: true, hasWater: true, hasCommunityCenter: false, hasPavilion: true, hasTables: true, hasGrill: true, hasBikeRack: false, hasBikeRepair: false, hasPlayground: true, hasDogPark: false, hasBaseball: false, hasBasketball: false, hasBikePark: false, hasDiscGolf: false, hasFitness: false, hasHandball: false, hasMultiPurpose: false, hasPickleball: false, hasPool: false, hasSkatePark: false, hasSoccer: false, hasSoftball: false, hasSplashpad: false, hasTennis: false, hasVolleyball: false, hasTrail: false, trailSurface: "", trailLength: 0.0),
    
    Park(id: UUID().uuidString, featured: true, parkType: Category.city, parkID: 19, name: "Brackenridge Park", address: "3700 North St. Marys Street", city: "San Antonio", state: "TX", zip: 78212, link: "https://www.sanantonio.gov/ParksAndRec/Parks-Facilities/All-Parks-Facilities/Parks-Facilities-Details/ArtMID/14820/ArticleID/2226/Brackenridge-Park?Park=19&Facility=", description: "Historic Brackenridge Park is a perennial favorite with San Antonio natives and visitors alike. The park is home to a stretch of the San Antonio River, the Japanese Tea Garden, Sunken Garden Theater, the San Antonio Zoo, Lambert Beach and Tony ‘Skipper’ Martinez ball fields. Lions Field Adult and Senior Center is also located on the perimeter of the park and San Antonio Botanical Garden is nearby at 555 Funston Place.", image: "https://www.sanantonio.gov/Portals/0/EasyGalleryImages/3/897/BrackenridgeAerialR.jpg", longitude: -98.476320, latitude: 29.460250, hasRestrooms: true, hasWater: true, hasCommunityCenter: true, hasPavilion: true, hasTables: true, hasGrill: true, hasBikeRack: true, hasBikeRepair: false, hasPlayground: true, hasDogPark: false, hasBaseball: false, hasBasketball: false, hasBikePark: false, hasDiscGolf: false, hasFitness: false, hasHandball: false, hasMultiPurpose: true, hasPickleball: false, hasPool: false, hasSkatePark: false, hasSoccer: false, hasSoftball: true, hasSplashpad: false, hasTennis: false, hasVolleyball: false, hasTrail: true, trailSurface: "Paved", trailLength: 1.7)
]



/*
init(key: String = "", featured: Bool, parkType: Int, parkID: Int, name: String, address: String, city: String, state: String, zip: Int, link: String, description: String, image: String, longitude: Double, latitude: Double, hasRestrooms: Bool, hasWater: Bool, hasCommunityCenter: Bool, hasPavilion: Bool, hasTables: Bool, hasGrill: Bool, hasBikeRack: Bool, hasBikeRepair: Bool, hasPlayground: Bool, hasDogPark: Bool, hasBaseball: Bool, hasBasketball: Bool, hasBikePark: Bool, hasDiscGolf: Bool, hasFitness: Bool, hasHandball: Bool, hasMultiPurpose: Bool, hasPickleball: Bool, hasPool: Bool, hasSkatePark: Bool, hasSoccer: Bool, hasSoftball: Bool, hasSplashpad: Bool, hasTennis: Bool, hasVolleyball: Bool, hasTrail: Bool, trailSurface: Int, trailLength: Double) {
    
        self.ref = nil
        self.key = key
        self.featured = featured
        self.parkType = parkType
        self.parkID = parkID
        self.name = name
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.link = link
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.hasRestrooms = hasRestrooms
        self.hasWater = hasWater
        self.hasCommunityCenter = hasCommunityCenter
        self.hasPavilion = hasPavilion
        self.hasTables = hasTables
        self.hasGrill = hasGrill
        self.hasBikeRack = hasBikeRack
        self.hasBikeRepair = hasBikeRepair
        self.hasPlayground = hasPlayground
        self.hasDogPark = hasDogPark
        self.hasBaseball = hasBaseball
        self.hasBasketball = hasBasketball
        self.hasBikePark = hasBikePark
        self.hasDiscGolf = hasDiscGolf
        self.hasFitness = hasFitness
        self.hasHandball = hasHandball
        self.hasMultiPurpose = hasMultiPurpose
        self.hasPickleball = hasPickleball
        self.hasPool = hasPool
        self.hasSkatePark = hasSkatePark
        self.hasSoccer = hasSoccer
        self.hasSoftball = hasSoftball
        self.hasSplashpad = hasSplashpad
        self.hasTennis = hasTennis
        self.hasVolleyball = hasVolleyball
        self.hasTrail = hasTrail
        self.trailSurface = trailSurface
        self.trailLength = trailLength
    
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let featured = value["featured"] as? Bool,
            let parkType = value["parkType"] as? Int,
            let parkID = value["parkID"] as? Int,
            let name = value["name"] as? String,
            let address = value["address"] as? String,
            let city = value["city"] as? String,
            let state = value["state"] as? String,
            let zip = value["zip"] as? Int,
            let link = value["link"] as? String,
            let description = value["description"] as? String,
            let image = value["image"] as? String,
            let longitude = value["longitude"] as? Double,
            let latitude = value["latitude"] as? Double,
            let hasRestrooms = value["hasRestrooms"] as? Bool,
            let hasWater = value["hasWater"] as? Bool,
            let hasCommunityCenter = value["hasCommunityCenter"] as? Bool,
            let hasPavilion = value["hasPavilion"] as? Bool,
            let hasTables = value["hasTables"] as? Bool,
            let hasGrill = value["hasGrill"] as? Bool,
            let hasBikeRack = value["hasBikeRack"] as? Bool,
            let hasBikeRepair = value["hasBikeRepair"] as? Bool,
            let hasPlayground = value["hasPlayground"] as? Bool,
            let hasDogPark = value["hasDogPark"] as? Bool,
            let hasBaseball = value["hasBaseball"] as? Bool,
            let hasBasketball = value["hasBasketball"] as? Bool,
            let hasBikePark = value["hasBikePark"] as? Bool,
            let hasDiscGolf = value["hasDiscGolf"] as? Bool,
            let hasFitness = value["hasFitness"] as? Bool,
            let hasHandball = value["hasHandball"] as? Bool,
            let hasMultiPurpose = value["hasMultiPurpose"] as? Bool,
            let hasPickleball = value["hasPickleball"] as? Bool,
            let hasPool = value["hasPool"] as? Bool,
            let hasSkatePark = value["hasSkatePark"] as? Bool,
            let hasSoccer = value["hasSoccer"] as? Bool,
            let hasSoftball = value["hasSoftball"] as? Bool,
            let hasSplashpad = value["hasSplashpad"] as? Bool,
            let hasTennis = value["hasTennis"] as? Bool,
            let hasVolleyball = value["hasVolleyball"] as? Bool,
            let hasTrail = value["hasTrail"] as? Bool,
            let trailSurface = value["trailSurface"] as? Int,
            let trailLength = value["trailLength"] as? Double
        
            else {
                return nil
            }
        
        //self.id = id
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.featured = featured
        self.parkType = parkType
        self.parkID = parkID
        self.name = name
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.link = link
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.hasRestrooms = hasRestrooms
        self.hasWater = hasWater
        self.hasCommunityCenter = hasCommunityCenter
        self.hasPavilion = hasPavilion
        self.hasTables = hasTables
        self.hasGrill = hasGrill
        self.hasBikeRack = hasBikeRack
        self.hasBikeRepair = hasBikeRepair
        self.hasPlayground = hasPlayground
        self.hasDogPark = hasDogPark
        self.hasBaseball = hasBaseball
        self.hasBasketball = hasBasketball
        self.hasBikePark = hasBikePark
        self.hasDiscGolf = hasDiscGolf
        self.hasFitness = hasFitness
        self.hasHandball = hasHandball
        self.hasMultiPurpose = hasMultiPurpose
        self.hasPickleball = hasPickleball
        self.hasPool = hasPool
        self.hasSkatePark = hasSkatePark
        self.hasSoccer = hasSoccer
        self.hasSoftball = hasSoftball
        self.hasSplashpad = hasSplashpad
        self.hasTennis = hasTennis
        self.hasVolleyball = hasVolleyball
        self.hasTrail = hasTrail
        self.trailSurface = trailSurface
        self.trailLength = trailLength
    }
    
    func toAnyObject() -> Any {
        return [
            "featured": featured,
            "parkType": parkType,
            "parkID": parkID,
            "name": name,
            "address": address,
            "city": city,
            "state": state,
            "zip": zip,
            "link": link,
            "description": description,
            "image": image,
            "longitude": longitude,
            "latitude": latitude,
            "hasRestrooms": hasRestrooms,
            "hasWater": hasWater,
            "hasCommunityCenter": hasCommunityCenter,
            "hasPavilion": hasPavilion,
            "hasTables": hasTables,
            "hasGrill": hasGrill,
            "hasBikeRack": hasBikeRack,
            "hasBikeRepair": hasBikeRepair,
            "hasPlayground": hasPlayground,
            "hasDogPark": hasDogPark,
            "hasBaseball": hasBaseball,
            "hasBasketball": hasBasketball,
            "hasBikePark": hasBikePark,
            "hasDiscGolf": hasDiscGolf,
            "hasFitness": hasFitness,
            "hasHandball": hasHandball,
            "hasMultiPurpose": hasMultiPurpose,
            "hasPickleball": hasPickleball,
            "hasPool": hasPool,
            "hasSkatePark": hasSkatePark,
            "hasSoccer": hasSoccer,
            "hasSoftball": hasSoftball,
            "hasSplashpad": hasSplashpad,
            "hasTennis": hasTennis,
            "hasVolleyball": hasVolleyball,
            "hasTrail": hasTrail,
            "trailSurface": trailSurface,
            "trailLength": trailLength
        ]
    }
}
*/
