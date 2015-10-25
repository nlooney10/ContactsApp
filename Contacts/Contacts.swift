//
//  Contacts.swift
//  Contacts
//
//  Created by Nick Looney on 10/18/15.
//  Copyright © 2015 Nick Looney. All rights reserved.
//

import UIKit

class Contacts: NSObject {
    var contactName: String?
    var contactNumber: String?
    
    init (contactName: String? = nil, contactNumber: String? = nil) {
        self.contactName = contactName
        self.contactNumber = contactNumber
        super.init()
    }
}
