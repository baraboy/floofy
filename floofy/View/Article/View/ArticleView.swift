//
//  ArticleView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 06/06/23.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                ScrollView {
                    LazyVStack(spacing: 18) {
                        ForEach(0..<articles.count, id: \.self) { index in
                            ArticleCardView(article: articles[index])
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Articles")
            .background(Color.white)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
