//
//  Ride.swift
//  TaskEdvora
//
//  Created by Mohamed on 23/02/2022.
//

import Foundation

// MARK: - WelcomeElement
struct Ride: Codable {
    let id, originStationCode: Int
    let stationPath: [Int]
    let destinationStationCode: Int
    let date: String
    var mapURL: String
    let state, city: String

    enum CodingKeys: String, CodingKey {
        case id
        case originStationCode = "origin_station_code"
        case stationPath = "station_path"
        case destinationStationCode = "destination_station_code"
        case date
        case mapURL = "map_url"
        case state, city
    }
}
//Edvora
//Nearest
//Upcoming (4)
//Past (2)
//Filters
//100 Km
//Ride ID
//Date
//20 Km
//001
//16th Feb
//100 Km
//001
//26th Feb
