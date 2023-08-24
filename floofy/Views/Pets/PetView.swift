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
                                                CardPetView(petSelected: pet)
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
                                                CardPetView(petSelected: pet)
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
