//
//  TestView_ProfilePictureView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct TestView_ProfilePictureView: View {
    
    
    
    var body: some View {
        ProfilePicture(url: URL(string: "https://images.pexels.com/photos/4906286/pexels-photo-4906286.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")!, tintColor: .gray, isEditable: true)
    }
}


struct TestView_ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        TestView_ProfilePictureView()
    }
}


struct ProfilePicture: View {
    var url: URL
    var tintColor: Color
    var isEditable: Bool = false
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ZStack {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(5)
                Circle()
                    .stroke(tintColor, lineWidth: 5)
            }.frame(width: 180, height: 180)
            
            if isEditable {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 40))
                        .background(Color.white)
                        .foregroundColor(tintColor)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }).padding(.trailing, 10)
            }
        }
        
    }
}
