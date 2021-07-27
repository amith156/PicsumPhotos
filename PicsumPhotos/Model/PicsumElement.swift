//
//  PicsumElement.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 26/07/2021.
//

import Foundation

typealias Picsum = [PicsumElement]

struct PicsumElement: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}


