//
//  CardPetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/23.
//

import SwiftUI

struct CardPetView: View {
    let petSelected: PetsItem
    @State var selectedLabelCategory: Category = .grooming
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(CustomColor.primaryColor, lineWidth: 2)
                .frame(width: 359, height: 152)
            VStack {
                HStack {
                    Circle()
                        .strokeBorder(CustomColor.challengeFirstColor, lineWidth: 2)
                        .frame(width: 100, height: 100)
                        .overlay(       Image(uiImage: UIImage(data: petSelected.imagePets ?? Data()) ?? UIImage())
                            .resizable()
                            .frame(width: 120, height: 100)
                            .clipShape(Circle())
                        )
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(petSelected.namePets ?? "Meong" )
                                .font(.system(size: 17, weight: .regular))
                                .frame(alignment: .topLeading)
                                .foregroundColor(.black)
                            VStack {
                                ForEach(petSelected.reminderArray) { reminder in
                                    let dateNow = Date()
                                    if reminder.dateReminder ?? Date() > dateNow {
                                        if reminder.label ?? "Unknown" == selectedLabelCategory.rawValue {
                                            Text("Upcoming grooming : \(reminder.dateReminder ?? Date(), style: .date)")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.black)
                                        } else {
                                            Text("Upcoming clean cage : \(reminder.dateReminder ?? Date(), style: .date)")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                            Text("see activities...")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}
