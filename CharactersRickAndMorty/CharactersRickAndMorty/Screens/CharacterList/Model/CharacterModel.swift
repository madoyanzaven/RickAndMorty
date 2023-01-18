//
//  CharacterModel.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit

struct CharacterModel {
    let name: String
    let imagePath: String?
    let status: String
    let species: String
    let location: Location?
    let origin: Origin?
    let url: String
    
    var imageUrl: URL? {
        if let imagePath = imagePath {
            return URL(string: String(imagePath))
        }
        
        return nil
    }
    
    var statusInfo: String {
        return "\(status)-\(species)"
    }
    
    var characterStatusColor: UIColor {
        let caracterStatus: CaracterStatus = CaracterStatus(rawValue: status) ?? .unknown
        
        return caracterStatus.statusColor
    }
    
    var locationName: String {
        return location?.name ?? ""
    }
    
    var origineName: String {
        return origin?.name ?? ""
    }
}

struct Location {
    let name: String?
}

struct Origin {
    let name: String?
}

enum CaracterStatus: String {
    case alive = "Alive"
    case daed = "Dead"
    case unknown = "unknown"
    
    var statusColor: UIColor {
        switch self {
        case .alive:
            return Constants.Colors.mainGreen
        case .daed:
            return Constants.Colors.mainRed
        case .unknown:
            return Constants.Colors.statusGray
        }
    }
    
    var statusParameter: String {
        switch self {
        case .alive:
            return "alive"
        case .daed:
            return "dead"
        case .unknown:
            return "unknown"
        }
    }
}
