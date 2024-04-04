//
//  CustomSearchBar.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @State var txt : String = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Enter Here", text: $txt)
            
            Image(systemName: "mic.fill")
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(.white.opacity(0.6))
        .cornerRadius(10)
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    }
}
