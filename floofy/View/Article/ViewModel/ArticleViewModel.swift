//
//  ArticleViewModel.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 22/08/23.
//

import Foundation

func loadArticles() -> [ArticleModel] {
    if let url = Bundle.main.url(forResource: "articles", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let articles = try decoder.decode([ArticleModel].self, from: data)
            return articles
        } catch {
            print("Error loading articles: \(error)")
        }
    }
    return []
}

let articles = loadArticles()
