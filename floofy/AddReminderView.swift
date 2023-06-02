//
//  AddReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import SwiftUI

struct AddReminderView: View {
    
    @State private var categoryIndex = 0
    var categorySelection = ["Grooming", "Clean the Cage"]
    
    @State private var petNameIndex = 0
    var petNameSelection = ["Hengky", "Abu"]
    
    @State private var dateReminder = Date.now
    
    @State private var repeatReminderIndex = 0
    var repeatReminderSelection = ["Weekly", "Monthly"]
    
    @State private var soundNameIndex = 0
    var soundNameSelection = ["Radar", "Apa gitu kek"]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Form {
                    
                    Section() {
                        Picker(selection: $categoryIndex, label: Text("Label")) {
                            ForEach(0..<categorySelection.count) {
                                Text(self.categorySelection[$0])
                            }
                        }
                        
                        Picker(selection: $petNameIndex, label: Text("Pet")) {
                            ForEach(0..<petNameSelection.count) {
                                Text(self.petNameSelection[$0])
                            }
                        }
                    }

                    
                    Section() {
                        
                        DatePicker(selection: $dateReminder, in: ...Date.now, displayedComponents: .date) {
                            Text("Date")
                        }
                        
                        DatePicker(selection: $dateReminder, in: ...Date.now, displayedComponents: .hourAndMinute){
                            Text("Time")
                        }
                        
                        Picker(selection: $repeatReminderIndex, label: Text("Repeat")) {
                            ForEach(0..<repeatReminderSelection.count) {
                                Text(self.repeatReminderSelection[$0])
                            }
                        }

                    }
                    
                    Section() {
                        
                        Picker(selection: $soundNameIndex, label: Text("Sound")) {
                            ForEach(0..<soundNameSelection.count) {
                                Text(self.soundNameSelection[$0])
                            }
                        }
                    }
                    
                }.navigationTitle("Add Reminder")
                    .shadow(radius: 2)
                    .scrollContentBackground(.hidden)
                    
                
                Button(action: {
                    
                }) {
                    Text("Add Reminder")
                        
                        .background(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 300 , height: 40 ,alignment: .center)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer(minLength: 70)
                
            }
            
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
