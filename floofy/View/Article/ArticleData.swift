//
//  ArticleData.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import Foundation

struct ArticleData: Identifiable, Codable {
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

func loadArticles() -> [ArticleData] {
    if let url = Bundle.main.url(forResource: "articles", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let articles = try decoder.decode([ArticleData].self, from: data)
            return articles
        } catch {
            print("Error loading articles: \(error)")
        }
    }
    return []
}

let articles = loadArticles()
