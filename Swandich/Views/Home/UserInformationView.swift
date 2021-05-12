//
//  UserInformationView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 11/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct UserInformationView: View {
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Image(systemName: "video")
                    .font(.system(size:25))
                Spacer()
                Image("Burger")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height:80)
                    .clipped()
                    .cornerRadius(50)
                Spacer()
                Image(systemName: "message")
                    .font(.system(size:25))
            }
            VStack {
                Text("Filipe Ferreira")
                    .font(.system(size:22))
                    .fontWeight(.semibold)
                Text("500 abonnés")
                    .fontWeight(.medium)
            }
        }
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
            .previewLayout(.sizeThatFits)
    }
}
