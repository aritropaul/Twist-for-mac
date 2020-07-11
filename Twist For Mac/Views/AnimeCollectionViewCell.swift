//
//  AnimeCollectionViewCell.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

class AnimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        posterImage.layer.cornerRadius = 8
    }
    
}
