//
//  ReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import SwiftUI

struct ReminderView: View {
    
    
    
    @State var reminders = ResourcerLoader.shared.loadReminderList()
    @State var showView = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    
                    ForEach(0..<reminders.count) { index in
                        HStack {
                            VStack(alignment: .leading) {
                                   
                                Text("\(reminders[index].nameActivity)")
                                
                                HStack() {
                                    Text("\(reminders[index].name),")
                                        .fontWeight(.ultraLight)
                                    
                                    Text("\(reminders[index].repeatWhatDay)").fontWeight(.ultraLight)
                                    
                                    }
                                }
                                
                                
                            Spacer()
                            Spacer()
                          
                            Toggle("Activate", isOn: $reminders[index].enable)
                                                   .labelsHidden()
                            
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "trash")
                            } .tint(.red)
                        })
                    }
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
    
    func delete (at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}

struct ResourcerLoader {
    static private(set) var shared = ResourcerLoader()
    
    func loadReminderList() -> [ReminderModel] {
        return [.init(id: 1, nameActivity: "Grooming", name: "Hengki", repeatWhatDay: "Weekly", enable: true), .init(id: 2, nameActivity: "Clean the Cage", name: "Abu", repeatWhatDay: "Monthly",enable: false)]
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
