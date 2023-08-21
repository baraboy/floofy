//
//  PetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/06/23.
//

import SwiftUI

struct PetView: View {
    @State private var showView = false
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    @State var selectedLabelCategory: Category = .grooming
    var body: some View {
        NavigationStack {
            VStack {
                if pets.isEmpty {
                    VStack(spacing: 30) {
                        Spacer()
                        Image("onboarding3")
                            .resizable()
                            .frame(width: 326, height: 283)
                        Text("Looks like you did not have any pets yet.")
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.center)
                        Spacer()
                        Button {
                            showView.toggle()
                        } label: {
                            Text("Add Pet")
                                .background(CustomColor.challengeFirstColor)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(width: 300, height: 40, alignment: .center)
                        }
                        .sheet(isPresented: $showView) {
                            AddPetView()
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                } else {
                    VStack {
                        Text("Cats")
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.system(.title2))
                            .padding(.leading, 15)
                            .foregroundColor(.black)
                        VStack {
                            ScrollView(.vertical, showsIndicators: true) {
                                VStack(spacing: 15) {
                                        ForEach(pets) { pet in
                                            if pet.petCategory == "Cat" {
                                                NavigationLink(destination: DetailPetView(selectionPet: pet)) {
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                            .stroke(CustomColor.challengeFirstColor, lineWidth: 2)
                                                            .frame(width: 359, height: 152)
                                                    VStack {
                                                                HStack {
                                                                    Circle()
                                                                        .strokeBorder(CustomColor.challengeFirstColor, lineWidth: 2)
                                                                        .frame(width: 100, height: 100)
                                                                        .overlay(       Image(uiImage: UIImage(data: pet.imagePets ?? Data()) ?? UIImage())
                                                                                .resizable()
                                                                                .frame(width: 120, height: 100)
                                                                                .clipShape(Circle())
                                                                        )
                                                                    VStack {
                                                                        VStack(alignment: .leading, spacing: 10) {

                                                                            Text(pet.namePets ?? "Meong" )
                                                                                .font(.system(size: 17, weight: .regular))
                                                                                .frame(alignment: .topLeading)
                                                                                .foregroundColor(.black)
                                                                            VStack {
                                                                                ForEach(pet.reminderArray) { reminder in
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
                                        }
                                }
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            }
                            .frame(height: 300)
                            .padding(.leading, 5)
                            Spacer()
                        }
                        Text("Dogs")
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.system(.title2))
                            .padding(.leading, 15)
                            .foregroundColor(.black)
                        VStack {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 15) {
                                    ForEach(pets) { pet in
                                        if pet.petCategory == "Dog" {
                                            NavigationLink(destination: DetailPetView(selectionPet: pet)) {

                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                        .stroke(CustomColor.primaryColor, lineWidth: 2)
                                                        .frame(width: 359, height: 152)
                                                    VStack {
                                                            HStack {
                                                                Circle().strokeBorder(CustomColor.challengeFirstColor, lineWidth: 2)
                                                                    .frame(width: 100, height: 100)
                                                                    .overlay(
                                                                            Image(uiImage: UIImage(data: pet.imagePets ?? Data()) ?? UIImage())
                                                                            .resizable()
                                                                            .frame(width: 120, height: 100)
                                                                            .clipShape(Circle())
                                )
                                                                VStack {
                                                                    VStack(alignment: .leading, spacing: 10) {

                                                                        Text(pet.namePets ?? "Guk Guk" )
                                                                            .font(.system(size: 17, weight: .regular))
                                                                            .frame(alignment: .topLeading)
                                                                            .foregroundColor(.black)
                                   VStack {
                                       ForEach(pet.reminderArray) { reminder in
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
                                    }
                                }
                                .padding(.top, 5)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            }
                            .frame(height: 200)
                            .padding(.leading, 5)
                            Spacer()
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showView.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $showView) {
                                AddPetView()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Pets", displayMode: .large)
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
