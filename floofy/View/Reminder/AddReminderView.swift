//
//  AddReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import SwiftUI
import CoreData
import UserNotifications

enum Category: String, CaseIterable, Identifiable {
    case grooming = "Grooming"
    case clean = "Clean the Cage"
    var id: String { self.rawValue }
}

enum RepeatSelection: String, CaseIterable, Identifiable {
    case weekly = "Weekly"
    case monthly = "Monthly"
    var id: String { self.rawValue}
}

struct AddReminderView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var pet: PetsItem
    @Environment(\.dismiss) var dismiss
    @State var selectionExample: Category = .grooming
    @State var selectionRepeat: RepeatSelection = .weekly
    @State private var dateReminder = Date.now
    @State private var repeatReminderIndex = 0
    var repeatReminderSelection = ["Weekly", "Monthly"]
    @State private var soundNameIndex = 0
    var soundNameSelection = ["Radar"]
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Picker(selection: $selectionExample, label: Text("Label")) {
                            ForEach(Category.allCases) { categories in
                                Text(categories.rawValue.capitalized)
                                    .tag(categories)
                            }
                        }
                    }
                    Section {
                        DatePicker(selection: $dateReminder, in: ...Date.distantFuture, displayedComponents: .date) {
                            Text("Date")
                        }
                        DatePicker(selection: $dateReminder, in: ...Date.distantFuture, displayedComponents: .hourAndMinute) {
                            Text("Time")
                        }
                        Picker(selection: $selectionRepeat, label: Text("Repeat")) {
                            ForEach(RepeatSelection.allCases) { repeatSelected in
                                Text(repeatSelected.rawValue.capitalized)
                                    .tag(repeatSelected)
                            }
                        }

                    }
                    Section {
                        Picker(selection: $soundNameIndex, label: Text("Sound")) {
                            ForEach(0..<soundNameSelection.count, id: \.self) {
                                Text(self.soundNameSelection[$0])
                            }
                        }
                    }
                }.navigationTitle("Add Reminder")
                    .shadow(radius: 2)
                    .scrollContentBackground(.hidden)
                CustomButton(text: "Add Reminder") {
                    saveRemindertoCoreData()

                    dismiss()
                }
                Spacer(minLength: 70)
            }
        }
    }
    func saveRemindertoCoreData() {
        let newReminder = ReminderItem(context: moc)
        newReminder.label = selectionExample.rawValue
        newReminder.dateReminder = dateReminder
        newReminder.repeatReminder = selectionRepeat.rawValue

        pet.addToReminder(newReminder)

        do {
            try? moc.save()
        }

        setNotication(label: selectionExample.rawValue, date: dateReminder, namePet: pet.namePets ?? "Unknown")
    }
    func setNotication(label: String, date: Date, namePet: String) {
        let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute, .second], from: date)
        let triggerMonthly = Calendar.current.dateComponents([.month, .hour, .minute, .second], from: date)
        let content = UNMutableNotificationContent()
        content.title = "Hey this is the time!"
        content.sound = .defaultRingtone
        content.body = "\(label) \(namePet)"
        if repeatReminderIndex == 0 {
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
            let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                if error != nil {
                    print("Something went wrong")
                }
            })
        } else if repeatReminderIndex == 1 {
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerMonthly, repeats: true)
            let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                if error != nil {
                    print("Something went wrong")
                }
            })
        }
    }
}

/*
 struct AddReminderView_Previews: PreviewProvider {
 
 @Environment(\.managedObjectContext) var moc
 
 static var previews: some View {
 AddReminderView(moc: moc)
 }
 }
 */
