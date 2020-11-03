//
//  MediaDataModel.swift
//  IRDB_NM
//
//  Created by Nathan Mckenzie on 11/2/20.
//

import UIKit

class MediaDataModel: Codable {
    
    var TVShows: [TvShows] = []
}
class TvShows: Codable{
    let org: String
    let show: [Shows]
}
class Shows: Codable{
    let name: String
    let rate: String
    let yearStart: String
    let yearEnd: String?
    let seasons: String
    let episodes: Int?
    let genres: String
    let imageURL: String
    let description: String
    let storyLine: String
    let castSummary: [Cast]
    
}
class Cast: Codable{
    let actorName: String
    let role: String
}

