//
//  ShowDataViewController.swift
//  TaskEdvora
//
//  Created by Mohamed on 24/02/2022.
//

import UIKit

class ShowDataViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var rideIdLbl: UILabel!
    
    @IBOutlet weak var originStationLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var distanceLbl: UILabel!
    
    @IBOutlet weak var stationPathLbl: UILabel!
    
    @IBOutlet weak var mapImage: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Variables
    
    var objRide: Ride!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rideIdLbl.text = "\(objRide.id)"
        originStationLbl.text = "\( objRide.originStationCode)"
        dateLbl.text = objRide.date
        distanceLbl.text = "\(objRide.destinationStationCode)"
        stationPathLbl.text = "\(objRide.stationPath)"
        
        let imageUrl = "https://picsum.photos/\(objRide.id)"
        mapImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(systemName: "exclamationmark.triangle.fill"))
        
        imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(systemName: "exclamationmark.triangle.fill"))
            
            
        }
        
    }
    
    

   


