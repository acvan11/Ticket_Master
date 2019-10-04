//
//  AttractionTableCell.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class AttractionTableCell: UITableViewCell {

    
    @IBOutlet weak var attractionImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    static let identifier = "AttractionTableCell"
    
    var attr: Attraction! {
        didSet {
            //TODO: Cache
            attractionImage.image = #imageLiteral(resourceName: "1")
            mainLabel.text = attr.name
            subLabel.text = attr.classifications.first!.genre.name
        }
    }
    
}
