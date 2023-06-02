//
//  ReminderView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/06/23.
//

import SwiftUI

struct ReminderView: View {
    
    @State var reminders = ResourcerLoader.shared.loadReminderList()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List(reminders) { reminder in
                    
                    HStack {
                        VStack(alignment: .leading) {
                               
                            Text("\(reminder.nameActivity)")
                            
                            Text("\(reminder.name)")
                                .fontWeight(.ultraLight)
                            
                            }
                            
                            
                        Spacer()
                        Spacer()
                      
                        Toggle("", isOn: .constant(reminder.enable))
                        
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Reminders")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("plus")
                            .frame(width: 150, height: 150)
                    }
                }
            }
        }
        .accentColor(.black)
        
    }
}

struct ResourcerLoader {
    static private(set) var shared = ResourcerLoader()
    
    func loadReminderList() -> [ReminderModel] {
        return [.init(id: 1, nameActivity: "Grooming", name: "Hengki", enable: true), .init(id: 2, nameActivity: "Clean the cage", name: "Hengki", enable: false)]
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
