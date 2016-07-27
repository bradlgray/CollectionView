//
//  imageCell.swift
//  IosInterview
//
//  Created by Brad Gray on 7/27/16.
//  Copyright © 2016 Brad Gray. All rights reserved.
//

import UIKit

class imageCell: UICollectionViewCell {
    
    @IBOutlet weak var Image: UIImageView!
    func configureCell(arrayImg: String) {
        
        Image.kf_setImageWithURL(NSURL(string: arrayImg)!)
    }
    
}
