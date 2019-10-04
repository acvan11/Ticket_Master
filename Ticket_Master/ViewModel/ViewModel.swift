//
//  ViewModel.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

protocol AttrDelegate: class {
    func update()
}

class ViewModel {
    weak var attrDelegate: AttrDelegate?
    
    var attrs = [Attraction]() {
        didSet {
           attrDelegate?.update()
        }
    }
    
    func getAttr() {
        MasterService.shared.getAttractions { [weak self] atr in
            self?.attrs = atr
            print("Attrs count: \(atr.count)")
        }
    }
}
