//
//  Services.swift
//  TaskEdvora
//
//  Created by Mohamed on 23/02/2022.
//

import Foundation
import UIKit


class RideAPI {
    
    class func fitchRequestRide (completion: @escaping([Ride]?, Error?) -> Void) {
        
        let url = Endpoint.rideUrl.url
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion([],error)
                return
            }
            print("DATA \(data)")
            
            let decoder = JSONDecoder()
            do {
                let decoderObject = try decoder.decode([Ride].self, from: data)
                completion(decoderObject, nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    class func fitchRequestMapKit(imageUrl: URL, completion:@escaping(UIImage? ,Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            print("DATA \(data)")
            
            let decoder = JSONDecoder()
            do {
                let downloadImage = UIImage(data: data)
                completion(downloadImage,nil)
                print(downloadImage)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}
