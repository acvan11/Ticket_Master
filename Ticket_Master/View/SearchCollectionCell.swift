//
//  SearchCollectionCell.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
    @IBOutlet weak var attrImage: UIImageView!
    
    static let identifier = "SearchCollectionCell"
    
    var attr: Attraction! {
        didSet {
            //TODO: Cache
            attrImage.image = #imageLiteral(resourceName: "1")
        }
    }
}
