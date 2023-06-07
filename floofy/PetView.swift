//
//  PetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/06/23.
//

import SwiftUI

struct PetView: View {
    
    @State var showView = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack() {
                Text("Cats")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.system(.title2))
                    .padding(.leading, 15)
                
                VStack {
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 15) {
                            
                            VStack() {
                                ZStack() {
                                   
                                    Image("cobaGambar")
                                        .fixedSize()
                            
                    
                                    Circle()
                                        .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        
                                }
                                .padding(.top, 60)
                                
                                VStack() {
                                    
                                    Text("Meong")
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
                            
                            VStack {
                                ZStack() {
                                   
                                    Image("cobaGambar")
                                        .fixedSize()
                            
                    
                                    Circle()
                                        .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        
                                }
                                .padding(.top, 60)
                                
                                VStack() {
                                    
                                    Text("Metal")
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
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                    .frame(height: 100)
                    .padding(.leading, 5)
                    
                    Spacer()
                }
                
                Spacer(minLength: 65)
                
                Text("Dogs")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.system(.title2))
                    .padding(.leading, 15)
                VStack {
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 15) {
                            
                            VStack() {
                                ZStack() {
                                   
                                    Image("cobaGambar")
                                        .fixedSize()
                            
                    
                                    Circle()
                                        .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        
                                }
                                .padding(.top, 60)
                                
                                VStack() {
                                    
                                    Text("Hengki")
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
                            
                            VStack {
                                ZStack() {
                                   
                                    Image("cobaGambar")
                                        .fixedSize()
                            
                    
                                    Circle()
                                        .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        
                                }
                                .padding(.top, 60)
                                
                                VStack() {
                                    
                                    Text("Brownie")
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
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                    .frame(height: 100)
                    .padding(.leading, 5)
                    
                    
                }
                
                
                
            }
            Spacer()
            
            

            
            .padding(.leading, 10)
            .navigationBarTitle("Pets", displayMode: .large)
            //                        .onAppear(perform: getUsers)
            .listStyle(.plain)
            .navigationTitle("Pets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showView) {
                        AddReminderView()
                    }
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.large)
        
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
