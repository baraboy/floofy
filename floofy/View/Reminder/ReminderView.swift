//
//  ReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import UserNotifications
import SwiftUI

struct ReminderView: View {
    
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var reminderItems: FetchedResults<ReminderItem>

//    @FetchRequest(sortDescriptors: []) var pets: FetchedResults<PetsItem>
    
    @StateObject var pet: PetsItem
    
    @State var showView = false
    @State var showViewEdit = false
    
    @State private var showingAlert = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                if pet.reminderArray.isEmpty {
                    
                    Spacer()

                    Image("reminderImage")
                        .resizable()
                        .frame(width: 269,height: 328)

                    Text("Get notifications about your cat's or dog's schedule that have set in advance")
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)

                    Spacer(minLength: 15)

                    Button {
                        showView.toggle()

                        // code for notification
                        scheduleNotification()

                    } label: {
                        Text("Add Reminder")

                            .background(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(width: 300 , height: 40 ,alignment: .center)
                    }
                    .sheet(isPresented: $showView) {
                        AddReminderView(pet: pet)
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()

                } else {
                    VStack {
                        
                        List() {
                            ForEach(pet.reminderArray) { reminder in
                                
                                HStack() {
                                    VStack(alignment: .leading) {
                                        
                                        Text(reminder.label ?? "Unknown")
                                        
                                        HStack() {
                                            
                                            Text(reminder.repeat_item ?? "Unknown")
                                                .fontWeight(.ultraLight)
                                        }
                                    }
                                    
                                    Spacer()
                                    Spacer()
                                    
                                    Toggle("Active", isOn: .constant(true))
                                        .labelsHidden()
                                }
                            }
                            .onDelete(perform: deleteReminder)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {

                                // code for notification
                                scheduleNotification()
                                
                                showView.toggle()

                            } label: {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $showView) {
                                AddReminderView(pet: pet)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Reminders")
            
        }
        .navigationBarTitleDisplayMode(.large)
        //.navigationBarBackButtonHidden(true)
        
    }
    
    func scheduleNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ _, error in
            if let error {
                print("Notification access not granted.", error.localizedDescription)
            }
        }
    }
    
    func sendNotification(title: String, subtitle: String, secondsLater: TimeInterval, isRepeating: Bool) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if let error {
                    print("Notification access not granted.", error.localizedDescription)
                }
            }
        
            // Define the content
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsLater, repeats: isRepeating)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func deleteReminder(at offsets: IndexSet) {
        for offset in offsets {
            let reminder = pet.reminderArray[offset]
            moc.delete(reminder)
        }
        
        try? moc.save()
    }
    
}


//struct ReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderView()
//    }
//}
