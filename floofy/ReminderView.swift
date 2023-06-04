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
    @FetchRequest(sortDescriptors: []) var reminderItems: FetchedResults<ReminderItem>

    @State var showView = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List() {
                    
                    ForEach(reminderItems) { reminder in
                        HStack {
                            VStack(alignment: .leading) {

                                Text(reminder.label ?? "Unknown")

                                HStack() {
                                    Text(reminder.name ?? "Unknown")
                                        .fontWeight(.ultraLight)

                                    Text("Dummy data").fontWeight(.ultraLight)
                                    }
                                }

                            Spacer()
                            Spacer()

                            Toggle("Activate", isOn: .constant(true))
                                .labelsHidden()

                        }
                    }
                    .onDelete(perform: deleteReminder)
                }
                
                Button {
                    
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
                        if success {
                            
                            self.scheduleTest()
                        } else if error != nil{
                            print("error occurr ed")
                        }
                    })
                    
                } label: {
                    Text("Tes Notification")
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showView.toggle()
                        // code for notification
                        scheduleNotification()
                        
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
    
    func scheduleTest() {
        
        let content = UNMutableNotificationContent()
        content.title = "Hey this is the time!"
        content.sound = .defaultCritical
        content.body = "Let's walk with your dog!"
        
        let targetDate = Date().addingTimeInterval(5)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print("Something went wrong")
            }
        })
    }
    
    func deleteReminder(at offsets: IndexSet) {
        for offset in offsets {
            let reminder = reminderItems[offset]
            moc.delete(reminder)
        }
        
        try? moc.save()
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
