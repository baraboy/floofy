//
//  PetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/06/23.
//

import SwiftUI

struct PetView: View {
    
    @State private var showView = false
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var pets: FetchedResults<PetsItem>
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                if pets.isEmpty {
                    
                    VStack(spacing: 30) {
                        Spacer()
                        Image("onboarding3")
                            .resizable()
                            .frame(width: 326,height: 283)
                        
                        Text("Looks like you did not have any pets yet.")
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        Button {
                            showView.toggle()
                            
                        } label: {
                            Text("Add Pet")
                            
                                .background(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255))
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(width: 300 , height: 40 ,alignment: .center)
                        }
                        .sheet(isPresented: $showView) {
                            AddPetView()
                        }
                        
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                    
                } else {
                    VStack() {
                        Text("Cats")
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.system(.title2))
                            .padding(.leading, 15)
                        
                        VStack {
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 15) {
                                    
                                    ForEach(pets) { pet in
                                        
                                        if(pet.pet_category == "Cat") {
                                            VStack() {
                                                ZStack() {
                                                    
                                                    Image(uiImage: UIImage(data: pet.image_pets ?? Data()) ?? UIImage())
                                                        .resizable()
                                                        .frame(width: 120, height: 100)
                                                        .clipShape(Circle())
                                                    
                                                    
                                                    Circle()
                                                        .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                                        .frame(width: 100, height: 100)
                                                    
                                                }
                                                .padding(.top, 60)
                                                
                                                VStack() {
                                                    
                                                    Text(pet.name_pets ?? "Meong" )
                                                        .font(.system(size: 15, weight: .regular))
                                                        .frame(alignment: .topLeading)
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("Last Grooming : 03/02/23")
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Text("Last Clean Cage : 01/04/23")
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            }
                            .frame(height: 100)
                            .padding(.leading, 5)
                            
                            Spacer()
                        }
                        
                        //Spacer(minLength: 65)
                        
                        Text("Dogs")
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.system(.title2))
                            .padding(.leading, 15)
                        VStack {
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 15) {
                                    
                                    ForEach(pets) { pet in
                                        
                                        if(pet.pet_category == "Dog") {
                                            
                                            
                                            NavigationLink(destination: DetailPetView(moc: moc)) {
                                                
                                                VStack() {
                                                    ZStack() {
                                                        
                                                        Image(uiImage: UIImage(data: pet.image_pets ?? Data()) ?? UIImage())
                                                            .resizable()
                                                            .frame(width: 120, height: 100)
                                                            .clipShape(Circle())
                                                        
                                                        
                                                        Circle()
                                                            .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                                            .frame(width: 100, height: 100)
                                                        
                                                    }
                                                    .padding(.top, 60)
                                                    
                                                    VStack() {
                                                        
                                                        Text(pet.name_pets ?? "Meong" )
                                                            .font(.system(size: 15, weight: .regular))
                                                            .frame(alignment: .topLeading)
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("Last Grooming : 03/02/23")
                                                                .font(.system(size: 12, weight: .regular))
                                                            
                                                            Text("Last Clean Cage : 01/04/23")
                                                                .font(.system(size: 12, weight: .regular))
                                                        }
                                                        
                                                        
                                                    }
                                                }
                                            }
                                            
                                            
                                        }
                                    }
                                }
                                .padding(.top, 5)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            }
                            .frame(height: 100)
                            .padding(.leading, 5)
                            
                            Spacer()
                        }
                        
                    }
                    // Spacer()
                    
                    //                        .padding(.leading, 10)
                    //                        .listStyle(.plain)
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
