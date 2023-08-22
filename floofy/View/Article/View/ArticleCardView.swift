//
//  ArticleCardView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 18/08/23.
//

import SwiftUI

struct ArticleCardView: View {
    @State private var isShowingModal = false
    var article: ArticleModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(article.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360, height: 250)
                .cornerRadius(10)

            Rectangle()
                .foregroundColor(Color.gray.opacity(0.7))
                .frame(maxWidth: .infinity)
                .padding(.top, 165)

            VStack {
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading)
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(8)
        .onTapGesture {
            isShowingModal = true
        }
        .sheet(isPresented: $isShowingModal) {
            ArticleDetailView(article: article)
        }
    }
}
