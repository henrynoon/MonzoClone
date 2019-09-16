//
//  PaymentInfoHeader.swift
//  MonzoClone
//
//  Created by Henry Noon on 15/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit
import MapKit

class PaymentInfoHeader: NSObject {
//This more closely matches the data recieved back from Monzo API
    var amount: String?
    var created: String?
    var address: String?
    var city: String?
    var country: String?
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    var postcode: String?
    var region: String?
    var logo: String?
    var name: String?
}
