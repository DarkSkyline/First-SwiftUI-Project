 //
 //  LikeButtonView.swift
 //  Swandich
 //
 //  Created by Filipe Ferreira on 11/11/2020.
 //  Copyright © 2020 Filipe Ferreira. All rights reserved.
 //
 
 import SwiftUI
 
 struct LikeButtonView: View {
    
    let onColor: Color
    let offColor: Color
    
    @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: {
            self.onClickButton()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size:22))
                .foregroundColor(isLiked ? onColor: offColor)
        })
        
    }
    
    private func onClickButton() {
        isLiked.toggle()
    }
 }
 
 struct LikeButtonView_Previews: PreviewProvider {
    
    @State static var isLiked = true
    @State static var isNotLiked = false
    
    static var previews: some View {
        Group{
            LikeButtonView(onColor: .red, offColor: .gray, isLiked: $isLiked)
            LikeButtonView(onColor: .red, offColor: .gray, isLiked: $isNotLiked)
        }.previewLayout(.sizeThatFits)
        
    }
 }
