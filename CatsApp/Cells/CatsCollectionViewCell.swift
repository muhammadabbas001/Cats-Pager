//
//  CatsCollectionViewCell.swift
//  CatsApp
//
//  Created by Zeeshan Suleman on 27/03/2023.
//

import UIKit

class CatsCollectionViewCell: UICollectionViewCell {
    static let identifier = "CatsCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
