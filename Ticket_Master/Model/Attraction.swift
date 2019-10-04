//
//  Attraction.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class AttractionResponse: Decodable {
    let embedded: Embedded
    
    private enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

struct Embedded: Decodable {
    let attractions: [Attraction]
}

struct Attraction: Decodable {
    let name: String
    let url: String
    let id: String
    let images: [Image]
    let classifications: [Classification]
}

struct Image: Decodable {
    let ratio: String
    let url: String
}

struct Classification: Decodable {
    let genre: Genre
}

struct Genre: Decodable {
    let name: String
}
