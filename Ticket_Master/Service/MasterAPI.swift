//
//  MasterAPI.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

// https://app.ticketmaster.com/discovery/v2/attractions.json?countryCode=US&apikey=dMEH9dA923aPO3zcbS5v7Fps5YKnCANr

class MasterAPI {
    
    let baseUrl = "https://app.ticketmaster.com/discovery/v2/"
    let attractionType = "attractions.json?countryCode=US&"
    let key = "apikey=dMEH9dA923aPO3zcbS5v7Fps5YKnCANr"
    
    var getAttractionUrl: URL? {
        return URL(string: baseUrl + attractionType + key)
    }
    
}
