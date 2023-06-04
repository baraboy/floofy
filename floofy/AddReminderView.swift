//
//  AddReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import SwiftUI
import CoreData
import UserNotifications

struct AddReminderView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var reminderItems: FetchedResults<ReminderItem>
    @Environment(\.dismiss) var dismiss
    
    
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
                        
                        DatePicker(selection: $dateReminder, in: ...Date.distantFuture, displayedComponents: .date) {
                            Text("Date")
                        }
                        
                        DatePicker(selection: $dateReminder, in: ...Date.distantFuture, displayedComponents: .hourAndMinute){
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
                    
                    let reminder = ReminderItem(context: moc)
                    
                    reminder.id = UUID()
                    reminder.name = petNameSelection[petNameIndex]
                    reminder.label = categorySelection[categoryIndex]
                    reminder.date_item = dateReminder
//                    reminder.enable = true
                    
                    try? moc.save()
                    
                    setNotication(label: categorySelection[categoryIndex], date: dateReminder, namePet: petNameSelection[petNameIndex])
                    
                    dismiss()
                    
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
    
    func setNotication(label: String, date: Date, namePet: String) {
        let content = UNMutableNotificationContent()
        content.title = "Hey this is the time!"
        content.sound = .defaultCritical
        content.body = "\(label) \(namePet)"
        //"Let's walk with your dog!"
        
        let targetDate = date
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print("Something went wrong")
            }
        })
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
