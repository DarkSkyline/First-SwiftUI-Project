//
//  Test_2_View.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct Test_2_View: View {
    
    @StateObject var todoList = ToDoList()
    
    var body: some View {
        VStack{
            TodoListView(todoList: todoList)
            
            HStack{
                Button(action: {
                    if (!todoList.items.isEmpty) {
                        todoList.items.removeLast()
                    }
                }, label: {
                    Text("Delete")
                })
                Button(action: {
                    todoList.items.append("Item nº \(todoList.items.count + 1)")
                }, label: {
                    Text("New")
                })
            }
        }
    }
}

struct Test_2_View_Previews: PreviewProvider {
    static var previews: some View {
        Test_2_View()
    }
}


class ToDoList: ObservableObject {
    var lastModifiedDate = Date()
    @Published var items: [String] = []
}

struct TodoListView: View {
    
    @ObservedObject var todoList: ToDoList
    
    var body: some View {
        VStack {
            ForEach(todoList.items, id: \.self) { item in
                Text(item)
                    .padding()
            }
        }
    }
}
