//
//  User.swift
//  TaskEdvora
//
//  Created by Mohamed on 23/02/2022.
//

import Foundation

struct User: Codable {
    let stationCode: Int
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case stationCode = "station_code"
        case name, url
    }
}
