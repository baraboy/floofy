//
//  ReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

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
//                        .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
//
//                            Button {
//                                
//                            } label: {
//                                Image(systemName: "trash")
//                            } .tint(.red)
//                        })
                    }
                    .onDelete(perform: deleteReminder)
                    
                    
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showView.toggle()
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
