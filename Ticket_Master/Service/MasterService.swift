//
//  MasterService.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

typealias AttractionHandler = ([Attraction]) -> Void

final class MasterService {
    
    static let shared = MasterService()
    private init() {}
    
    func getAttractions(completion: @escaping AttractionHandler) {
        guard let url = MasterAPI().getAttractionUrl else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                print("Bad Task: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let attractionResponse = try JSONDecoder().decode(AttractionResponse.self, from: data)
                    let attractions = attractionResponse.embedded.attractions
                    completion(attractions)
                    return
                } catch let myError {
                    print("Couldn't Decode Attraction: \(myError.localizedDescription)")
                    completion([])
                    return
                }
            }
        }.resume()
    }
    
}
