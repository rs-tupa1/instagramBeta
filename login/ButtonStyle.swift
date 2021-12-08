//
//  ButtonStyles.swift
//  login
//
//  Created by GMO on 12/6/21.
//

import SwiftUI

struct ButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
            .contentShape(Rectangle())
            .background(Color.purple.opacity(0.2))
        
    }
}
