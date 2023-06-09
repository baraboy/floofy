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
                    .frame(height: 250)
                    .cornerRadius(10)
                
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.7))
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
        VStack {
            ZStack{
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
            }
            ScrollView{
                VStack{
                    Image(article.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                        .cornerRadius(10)
                    
                    Text(article.content)
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
        }.background(.white)
    }
}


struct Article: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var content: String
}

let articles: [Article] = [
    Article(imageName: "article_image1", title: "Get to know Scabies, a Skin Disease Caused by Animal Fleas.", content:"Scabies is a skin disease caused by animal fleas that affects both humans and animals. It is a highly contagious condition characterized by intense itching and a rash. Scabies mites, which are microscopic parasites, burrow into the skin, lay eggs, and cause an allergic reaction that leads to the characteristic symptoms. While scabies is commonly associated with human-to-human transmission, it can also be transmitted from animals, such as dogs and cats, to humans. To prevent and treat scabies, it is essential to address the infestation in both the affected individual and their pets, with the guidance of a healthcare professional or veterinarian. Early detection, proper hygiene, and regular veterinary care can help control the spread of scabies and ensure the well-being of both humans and animals."),
    Article(imageName: "article_image2", title: "Know the Side Effects That Can Occur when Sterilizing Dogs", content:"Sterilizing dogs, such as through spaying (for females) or neutering (for males), is a common practice to control pet population and promote their overall health. While sterilization offers several benefits, it's important to be aware of potential side effects that can occur. Some common side effects include temporary discomfort, swelling, or bruising at the surgical site. Hormonal changes may also lead to weight gain, increased appetite, or changes in behavior. In rare cases, complications such as infection, excessive bleeding, or adverse reactions to anesthesia can occur. It's crucial to consult with a veterinarian who can provide guidance on the best timing and procedure for sterilization and to closely monitor the dog's recovery post-surgery to ensure their well-being."),
    Article(imageName: "article_image3", title: "Get to know Scabies, a Skin Disease Caused by Animal Fleas.", content:"Scabies is a skin disease caused by animal fleas that affects both humans and animals. It is a highly contagious condition characterized by intense itching and a rash. Scabies mites, which are microscopic parasites, burrow into the skin, lay eggs, and cause an allergic reaction that leads to the characteristic symptoms. While scabies is commonly associated with human-to-human transmission, it can also be transmitted from animals, such as dogs and cats, to humans. To prevent and treat scabies, it is essential to address the infestation in both the affected individual and their pets, with the guidance of a healthcare professional or veterinarian. Early detection, proper hygiene, and regular veterinary care can help control the spread of scabies and ensure the well-being of both humans and animals."),
    Article(imageName: "article_image4", title: "Know the Side Effects That Can Occur when Sterilizing Dogs", content:"Sterilizing dogs, such as through spaying (for females) or neutering (for males), is a common practice to control pet population and promote their overall health. While sterilization offers several benefits, it's important to be aware of potential side effects that can occur. Some common side effects include temporary discomfort, swelling, or bruising at the surgical site. Hormonal changes may also lead to weight gain, increased appetite, or changes in behavior. In rare cases, complications such as infection, excessive bleeding, or adverse reactions to anesthesia can occur. It's crucial to consult with a veterinarian who can provide guidance on the best timing and procedure for sterilization and to closely monitor the dog's recovery post-surgery to ensure their well-being.")
]


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
