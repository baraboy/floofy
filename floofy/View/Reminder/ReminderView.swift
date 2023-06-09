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

    @FetchRequest(sortDescriptors: []) var pets: FetchedResults<PetsItem>
    
    @State var showView = false
    @State var showViewEdit = false
    
    @State private var showingAlert = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                if reminderItems.isEmpty {
                    
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
                        AddReminderView(moc: moc)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                        
                } else {
                    VStack {
                        List() {
                            
                            ForEach(reminderItems) { reminder in
                                HStack {
                                    VStack(alignment: .leading) {

                                        Text(reminder.label ?? "Unknown")

                                        HStack() {
                                            Text(reminder.name ?? "Unknown")
                                                .fontWeight(.ultraLight)

                                            Text(reminder.repeat_item ?? "Unknown").fontWeight(.ultraLight)
                                            }
                                        }

                                    Spacer()
                                    Spacer()

                                    Toggle("Activate", isOn: .constant(true))
                                        .labelsHidden()

                                }
                            }
                            .onDelete(perform: deleteReminder)
                            .onTapGesture {
                                showViewEdit.toggle()
                                
                            }
                            .sheet(isPresented: $showViewEdit) {
//                                EditReminderView(reminderr: reminderItems)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                
                                // code for notification
//                                scheduleNotification()
                                
                                if pets.isEmpty {
                                    showingAlert = true
                                } else {
                                    showView.toggle()
                                }
                                
                            } label: {
                                Image(systemName: "plus")
                            }
                            .alert("Important message", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) {} 
                            }
                            .sheet(isPresented: $showView) {
                                AddReminderView(moc: moc)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Reminders")
            
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
