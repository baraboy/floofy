//
//  ArticleModel.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import Foundation

struct ArticleModel: Identifiable, Codable {
    let id: Int
    let imageName: String
    let imageSource: String
    let title: String
    let para1: String
    let para2: String
    let para3: String
    let para4: String
    let para5: String
    let para6: String
}
