//
//  HabitGridView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 16/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HabitGridView: View {
    
    @Binding var selectedUrl: URL?
    
    let layoutGrid = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    private let urls = habitsImage
    
    let pictureSize = (UIScreen.main.bounds.width - 4) / 2
    
    var body: some View {
        LazyVGrid(columns: layoutGrid, spacing: 2){
            ForEach(urls, id: \.self) { urlsImage in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    KFImage(urlsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: pictureSize, height: pictureSize)
                        .clipped()
                        .onTapGesture(perform: {
                            selectedUrl = urlsImage
                        })
                    if urlsImage == selectedUrl {
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(Color.blue, width: 3)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                            .padding(8)
                    }
                   
                }
            }
        }
    }
}

struct HabitGridView_Previews: PreviewProvider {
    
    @State static var selectedURL: URL? = nil
    
    static var previews: some View {
        HabitGridView(selectedUrl: $selectedURL)
    }
}
