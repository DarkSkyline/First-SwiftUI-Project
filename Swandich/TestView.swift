//
//  TestView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 11/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @State var colorIsSelected: Bool = true
    
    let sections: [MenuSection] = [
        MenuSection(name: "Section 1", items: [
            MenuItem(name: "Gaming"),
            MenuItem(name: "Books"),
            MenuItem(name: "Sport")
        ]),
        MenuSection(name: "Section 2", items: [
            MenuItem(name: "Gaming"),
            MenuItem(name: "Books"),
            MenuItem(name: "Sport")
        ]),
        MenuSection(name: "Section 3", items: [
            MenuItem(name: "Gaming"),
            MenuItem(name: "Books"),
            MenuItem(name: "Sport")
        ])
    ]
    
    
    
    var body: some View {
        VStack{
            Text(colorIsSelected ? "View is selected" : "View not selected")
            ColorView(isSelected: $colorIsSelected)
            List{
                ForEach(sections) { section in
                    Section(header: Text(section.name)){
                        ForEach(section.items) { item in
                            Text(item.name)
                        }
                    }
                    
                }
            }.listStyle(GroupedListStyle())
        }
    }
}



struct MenuItem: Identifiable{
    var id = UUID().uuidString
    let name: String
}

struct MenuSection: Identifiable{
    
    var id = UUID().uuidString
    let name: String
    let items: [MenuItem]
}


struct ColorView: View{
    
    @Binding var isSelected: Bool
    
    var body: some View{
        ZStack{
            Circle()
                .foregroundColor(.red)
                .frame(width: 50, height: 50)
            if isSelected {
                Circle()
                    .strokeBorder(Color.gray, lineWidth: 3)
                    .frame(width: 60, height: 60)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    
    @State static var isSelected = true
    @State static var isNotSelected = false
    
    static var previews: some View {
        TestView()
    }
}
