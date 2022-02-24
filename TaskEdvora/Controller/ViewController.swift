//
//  ViewController.swift
//  TaskEdvora
//
//  Created by Mohamed on 23/02/2022.
//

import UIKit
import MapKit
import SDWebImage
import iOSDropDown

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var stateTxtField: DropDown!
    
    @IBOutlet weak var cityTxtFiled: DropDown!
    
    
    //MARK: - Varialbles
    
    var rideArr: [Ride] = []
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        setUpUI()
        
        
        RideAPI.fitchRequestRide { (ride, error) in
            if let unwrappedRide = ride {
                self.rideArr = unwrappedRide
                
                DispatchQueue.main.async {
                    print("\(self.rideArr[0].mapURL)")
                    self.collectionView.reloadData()
                }
                
            }
            if let unwrappedError = error {
                print(unwrappedError.localizedDescription)
            }
        }
        
        
        
    }
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        
        if menuConstrain.constant == 25 {
           animatedUIView(const: -280)
        } else {
//            menuConstrain.constant = 25
//            UIView.animate(withDuration: 0.4) {
//                self.menuConstrain.constant = CGFloat()
//                self.view.layoutIfNeeded()
//            }
            animatedUIView(const: 25)
        }
    }
    func animatedUIView(const: Int){
        UIView.animate(withDuration: 0.4) {
            self.menuConstrain.constant = CGFloat(const)
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - Helpers
    
    func setUpUI(){
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 10, trailing:20)
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33)), subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView.collectionViewLayout = layout
    }
}


//MARK: - Extension

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rideArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RideCollectionViewCell

        let imageUrl = "https://picsum.photos/\(rideArr[indexPath.row].id)"
        cell.imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(systemName: "exclamationmark.triangle.fill"))
        
        cell.setUp(id: rideArr[indexPath.row].id, date: rideArr[indexPath.row].date)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ShowData") as! ShowDataViewController
        
        vc.objRide = rideArr[indexPath.row]
        
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
    
    
}
