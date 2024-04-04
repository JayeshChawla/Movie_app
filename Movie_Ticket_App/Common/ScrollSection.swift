//
//  ScrollSection.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct ScrollSection: View {
    
    @State var title : String = "Now Playing"
    @State var posters : [String] = ["poster1" , "poster2" , "poster3" , "poster4" ,"poster5" ,"poster6"]
    
    var body: some View {
        VStack (alignment : .leading){
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal , 20)
            
            ScrollView(.horizontal , showsIndicators: false){
                HStack(spacing : 20){
                    ForEach(posters.indices, id: \.self) { index in
                        
                        NavigationLink {
                            Booking()
                        } label: {
                            Image(posters[index])
                                .resizable()
                                .frame(width: 100, height: 130)
                                .cornerRadius(20)
                        }

                       
            
                    }
                }
                .offset(x: 20)
                .padding(.trailing , 40)
            }
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}
