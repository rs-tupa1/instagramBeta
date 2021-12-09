//
//  Home.swift
//  login
//
//  Created by GMO on 12/6/21.
//

import SwiftUI

struct Home: View {
    
    
    init() {
        let navBar = UINavigationBarAppearance()
        navBar.backgroundColor = UIColor.black
    }
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                Color.black.tabItem {
                    Image("home_selected")
                }
                Color.red
                    .tabItem {
                        Image("search_selected")
                    }
                Color.green
                    .tabItem {
                        Image("like_selected")
                    }
                Color.blue
                    .tabItem {
                        Image("profile_selected")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarItems(
            
            leading:
                Image("Instagram_logo_white-1")
                .renderingMode(.template)
                .foregroundColor(.black),
            
            trailing: HStack {
                
                Image("plus_unselected")
                
                Image("gear")
            }
        )
    }
}
