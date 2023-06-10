//
//  ArticleData.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import Foundation

struct Article: Identifiable {
    var id = UUID()
    var imageName: String
    var imageSource: String
    var title: String
    var para1: String
    var para2: String
    var para3: String
    var para4: String
    var para5: String
    var para6: String
}


let articles: [Article] = [
    Article(imageName: "article_image1", imageSource: "image.petmd.com", title: "Get to know Scabies, a Skin Disease Caused by Animal Fleas", para1:"Scabies is a skin disease that affects both humans and animals, caused by tiny mites known as Sarcoptes scabiei. While scabies in humans is commonly transmitted through close personal contact, it can also be contracted from animals, particularly those infested with fleas. Here's what you need to know about scabies and its connection to animal fleas.",para2: "Scabies is highly contagious and can spread rapidly between animals and humans. When an animal, such as a dog or cat, is infested with fleas, the fleas can carry the scabies mites on their bodies. When these fleas come into contact with humans, the mites can transfer to human skin, leading to scabies infestation.", para3: "The symptoms of scabies in both humans and animals include intense itching, redness, and the appearance of small bumps or blisters on the skin. The itching is often more severe at night and can be distressing for both the affected animal and the pet owner. If you notice these symptoms in your pet or yourself after close contact with an infested animal, it is crucial to seek veterinary or medical attention.", para4: "To prevent the transmission of scabies from animal fleas, it is essential to address flea infestations promptly. Regular flea control measures should be implemented, such as using flea prevention products, regularly grooming and bathing pets, and maintaining a clean living environment. Additionally, if you suspect your pet has scabies, isolate them from other animals and seek veterinary care for proper diagnosis and treatment.", para5: "Treatment for scabies typically involves medication prescribed by a healthcare professional or veterinarian. It is important to follow the recommended treatment regimen diligently to ensure complete eradication of the mites. Treating the affected animal and any potentially infested humans simultaneously is crucial to prevent reinfestation.", para6: "In conclusion, scabies can be transmitted from animals to humans through contact with fleas. It is crucial to be aware of the symptoms and take prompt action if scabies is suspected in either pets or humans. By implementing effective flea control measures and seeking appropriate medical or veterinary care, the spread of scabies can be prevented, ensuring the well-being of both animals and humans."),
    Article(imageName: "article_image2", imageSource: "hillcrestanimals.com", title: "Know the Side Effects That Can Occur when Sterilizing Dogs", para1:"Sterilizing dogs, such as spaying (for females) or neutering (for males), is a common practice recommended by veterinarians and animal welfare organizations. While the benefits of sterilization are widely recognized, it is important to be aware of the potential side effects that may occur. Here are some common side effects associated with sterilizing dogs.", para2: "One common side effect is weight gain. After sterilization, dogs may experience a decrease in their metabolic rate, leading to a tendency to gain weight more easily. It is important for pet owners to monitor their dog's diet and provide regular exercise to maintain a healthy weight. Adjusting the dog's calorie intake and engaging in regular physical activity can help prevent excessive weight gain.", para3: "Another potential side effect is urinary incontinence in female dogs. This condition involves the involuntary leakage of urine and is more commonly observed in spayed female dogs. While the exact cause is not fully understood, it is believed to be related to changes in hormone levels and the anatomy of the urinary tract. If urinary incontinence occurs, it is important to consult with a veterinarian for appropriate management options.", para4: "Behavioral changes can also be observed after sterilization. Some dogs may become calmer and less prone to certain behavioral issues, such as aggression and roaming. However, in some cases, dogs may experience an increase in anxiety or fearfulness. It is important to provide a supportive and stimulating environment for the dog, including proper socialization and positive reinforcement training, to address any behavioral changes that may occur.", para5: "There is also a small risk of surgical complications associated with sterilization procedures, such as infection, bleeding, or adverse reactions to anesthesia. However, these risks are generally low, especially when the surgery is performed by a skilled veterinarian in a sterile environment. It is important to discuss the potential risks with the veterinarian and follow their pre- and post-operative care instructions to minimize the chances of complications.", para6: "In conclusion, while sterilizing dogs offers numerous benefits, it is important to be aware of the potential side effects. Weight gain, urinary incontinence, behavioral changes, and surgical complications are some of the possible side effects associated with sterilization. By understanding these risks and providing appropriate care, pet owners can ensure the well-being and health of their sterilized dogs."),
    Article(imageName: "article_image3", imageSource: "babcockhills.com", title: "The Importance of Regular Veterinary Check-ups for Pets", para1:"As pet owners, it is our responsibility to ensure the health and well-being of our beloved animal companions. One crucial aspect of maintaining their good health is scheduling regular veterinary check-ups. These routine visits to the veterinarian play a vital role in preventing and detecting potential health issues early on. Here are a few reasons why regular veterinary check-ups are essential for the health of our pets.", para2: "Firstly, veterinary check-ups allow for preventive care. During these visits, veterinarians can administer vaccinations to protect pets from various diseases. They also conduct thorough physical examinations to assess the overall health of the animal. Regular check-ups enable the early detection of any underlying health conditions, giving veterinarians the opportunity to intervene before the problem worsens.", para3: "Secondly, regular check-ups help in the early detection of diseases. Many illnesses and conditions in pets may not display obvious symptoms in the early stages. However, a veterinarian's trained eye can catch subtle signs that indicate an underlying problem. Early detection is crucial for effective treatment and can significantly improve the chances of a successful outcome. Moreover, it can save pet owners from expensive medical bills that may arise from advanced or emergency treatments.", para4: "Thirdly, routine veterinary visits contribute to the overall well-being of pets. Veterinarians provide valuable advice on nutrition, exercise, and general care. They can address any concerns or questions pet owners may have, ensuring that the pet's environment and lifestyle are conducive to their good health. Additionally, regular check-ups allow veterinarians to monitor the pet's weight, dental health, and other important parameters, making necessary recommendations to maintain their optimal condition.", para5: "In conclusion, regular veterinary check-ups are vital for maintaining the health and happiness of our pets. They offer preventive care, aid in the early detection of diseases, and provide valuable guidance on pet care. By prioritizing these routine visits, we can ensure that our furry friends lead long, healthy lives and enjoy our companionship for years to come.", para6: ""),
    Article(imageName: "article_image4",imageSource: "vetmed.tamu.edu", title: "The Benefits of Exercise for Pets", para1:"Just like humans, pets also require regular exercise to maintain their physical and mental well-being. Whether you have a dog, cat, or any other furry friend, incorporating exercise into their daily routine is crucial. Here are some of the benefits that regular exercise provides for pets:",para2: "First and foremost, exercise helps in weight management. Obesity is a common problem among pets, which can lead to a variety of health issues, such as diabetes, heart disease, and joint problems. Regular physical activity helps burn calories, maintain a healthy weight, and prevent these potential health complications. It also keeps pets fit, agile, and more energetic.", para3: "Secondly, exercise contributes to good mental health for pets. Physical activity stimulates their minds and provides an outlet for pent-up energy. It helps alleviate boredom, reduce anxiety, and prevent destructive behaviors that may arise from a lack of mental stimulation. Engaging in activities like playing with toys, chasing balls, or going for walks keeps pets mentally stimulated and content.", para4: "Furthermore, exercise strengthens the bond between pets and their owners. Activities like playing fetch or going for a hike together create opportunities for quality time and shared experiences. Regular exercise sessions become moments of bonding, trust-building, and mutual enjoyment. This enhanced relationship between pets and their owners fosters a happy and harmonious home environment.", para5: "Additionally, exercise promotes good cardiovascular health in pets. Regular physical activity improves blood circulation, strengthens the heart, and enhances lung function. It increases endurance and stamina, allowing pets to engage in activities for longer durations without fatigue. A healthy cardiovascular system is vital for overall well-being and longevity.", para6: "In conclusion, regular exercise is essential for the health and happiness of our pets. It aids in weight management, promotes mental well-being, strengthens the human-animal bond, and improves")
]
