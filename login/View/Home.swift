//
//  Home.swift
//  login
//
//  Created by GMO on 12/6/21.
//

import SwiftUI

struct Home: View {
    
    @State var selectedIndex = 0
    
    let tabBarImageNameSelected = ["home_selected", "search_selected", "like_selected", "profile_selected"]
    
    let tabBarImageNameUnSelected = ["home_unselected", "search_unselected", "like_unselected", "profile_unselected"]
    
    var body: some View {
        
        VStack {
            
            HStack (spacing: 16) {
                
                Image("Instagram_logo_white-1")
                    .renderingMode(.template)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image("plus_unselected")
                
                Image("list")
            }
            .padding(.horizontal, 16)
            
            ZStack {
                
                switch selectedIndex {
                case 0:
                    Color.yellow.edgesIgnoringSafeArea(.top)
                case 1:
                    Color.black.edgesIgnoringSafeArea(.top)
                case 2:
                    Color.green.edgesIgnoringSafeArea(.top)
                case 3:
                    Color.blue.edgesIgnoringSafeArea(.top)
                    
                default:
                    Color.white.edgesIgnoringSafeArea(.top)
                    
                }
            }
            
            Spacer()
            
            HStack {
                
                ForEach (0..<4) { num in
                    Button (action: {
                        
                        self.selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == selectedIndex {
                            Image(self.tabBarImageNameSelected[num])
                        } else {
                            Image(self.tabBarImageNameUnSelected[num])
                        }
                        
                        Spacer()
                    })
                }
            }
            .padding(.all, 8)
        }
    }
}
