//
//  RideCollectionViewCell.swift
//  TaskEdvora
//
//  Created by Mohamed on 24/02/2022.
//

import UIKit

class RideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var rideIdLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    func setUp(id: Int, date: String) {
        
        //imageView.image = photo
        rideIdLbl.text = "\(id)"
        dateLbl.text = date
    }
}
