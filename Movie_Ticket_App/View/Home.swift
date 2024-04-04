//
//  Home.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct Home: View {
    
    @State var animate : Bool = false
    @State var posters : [String] = ["poster1" , "poster2" , "poster3" , "poster4" ,"poster5" ,"poster6"]
    @State var posters1 : [String] = ["poster7" , "poster8" , "poster9" , "poster10" ,"poster11" ,"poster12"]
    @State var posters2 : [String] = ["poster13" , "poster14" , "poster15" , "poster16" ,"poster17" ,"poster18"]
    
    var body: some View {
        ZStack{
            
            Circle()
              .fill(Color("greenCircle"))
              .blur(radius: animate ? 30 : 100)
              .offset(x: animate ? -50 :  -130, y: animate ? -30 : -100)
              .task {
                  withAnimation(.easeInOut(duration: 7).repeatForever()){
                  animate.toggle()
                  }
              }
          Circle()
            .fill(Color("pinkCircle"))
            .blur(radius: animate ? 30 : 100)
            .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            VStack{
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title3)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing : 20){
                        ScrollSection(title: "Now Playing", posters: posters)
                        
                        ScrollSection(title: "Comming Soon", posters: posters1)
                        
                        ScrollSection(title: "Top Movies", posters: posters2)
                        
                        ScrollSection(title: "Favourite", posters: posters)
                    }
                    .padding(.bottom , 90)
                }
            }
            .frame(maxWidth : .infinity , maxHeight: .infinity , alignment: .top)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor") , Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   Home()
                       .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                       .previewDisplayName("iPhone SE (2nd generation)")
                   
                   Home()
                       .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                       .previewDisplayName("iPhone 11")
               
        
    }
    }
}
