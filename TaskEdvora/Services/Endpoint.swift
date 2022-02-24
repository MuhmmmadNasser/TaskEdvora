//
//  Endpoint.swift
//  TaskEdvora
//
//  Created by Mohamed on 23/02/2022.
//

import Foundation

enum Endpoint: String {
    
    case rideUrl
    
    case userUrl
    
    
    var stringValue: String {
        switch self {
        case .rideUrl:
            return "https://assessment.api.vweb.app/rides"
        case .userUrl:
            return "https://assessment.api.vweb.app/user"
            
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}
