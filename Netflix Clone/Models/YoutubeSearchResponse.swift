//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Jim Yang on 2023-08-18.
//

import Foundation

struct YoutubeSearchResponse: Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement:Codable{
    let kind: String
    let videoId: String
}
