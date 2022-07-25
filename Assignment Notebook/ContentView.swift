//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Ela Murat on 25/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItems(course: "Math", description: "math homework", dueDate: Date()), AssignmentItems(course: "English", description: "essay", dueDate: Date()), AssignmentItems(course: "Science", description: "at home experiment", dueDate: Date()), AssignmentItems(course: "Computer Science", description: "finish python code", dueDate: Date())]
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                HStack {
                    ForEach(assignmentItems) { item in
                        Text(item.description)
                    }
                    .onMove { indices, newOffset in
                        assignmentItems.move(fromOffsets:
                                                    indices, toOffset: newOffset)
                    }
                    .onDelete { indexSet in
                        assignmentItems.remove(atOffsets:
                                                        indexSet)
                }
                }
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(assignmentItems: assignmentItems)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                            showingAddItemView = true}) {
                            Image(systemName: "plus")
                })
        }
    }
}

struct AssignmentItems: Identifiable, Codable {
    var id = UUID ()
    var course = String()
    var description = String()
    var dueDate = Date()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


