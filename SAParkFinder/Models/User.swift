//
//  EditParkView.swift
//  SAParkFinder
//
//  Created by Leonard Box on 2/11/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import Foundation

class User {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
