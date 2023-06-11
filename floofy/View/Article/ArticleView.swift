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
                            ArticleCard(article: articles[index])
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

struct ArticleCard: View {
    @State private var isShowingModal = false
    var article: Article
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(article.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360, height: 250)
                .cornerRadius(10)
            
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.9))
                .frame(maxWidth: .infinity)
                .padding(.top, 165)
            
            VStack() {
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

struct ArticleDetailView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView{
                Image(article.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 250)
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                HStack{
                    
                    Text("Image source: \(article.imageSource)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                }.padding(.leading)
                
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
        .background(.white)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
