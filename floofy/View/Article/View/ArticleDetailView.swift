//
//  ArticleDetailView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 18/08/23.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: ArticleModel

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Image(article.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 250)
                    .cornerRadius(10)
                    .padding(.top, 20)

                HStack {
                    Text("Image source: \(article.imageSource)")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Spacer()

                }
                .padding(.leading)

                Text(article.title)
                    .font(.headline)
                    .bold()
                    .padding()

                Text(article.para1)
                    .font(.body)
                    .padding()

                Text(article.para2)
                    .font(.body)
                    .padding()

                Text(article.para3)
                    .font(.body)
                    .padding()

                Text(article.para4)
                    .font(.body)
                    .padding()

                Text(article.para5)
                    .font(.body)
                    .padding()

                Text(article.para6)
                    .font(.body)
                    .padding()

            }
        }
        .padding(.horizontal, 16)
        .foregroundColor(.black)
        .background(.white)
    }
}
