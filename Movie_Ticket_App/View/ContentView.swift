//
//  ContentView.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 01/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate : Bool = false
    
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
              
            
            VStack (spacing : 30){
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth : 248)
                
                
            }
            .padding(.horizontal , 20)
            .frame(maxWidth : .infinity , maxHeight: .infinity, alignment: .top)
            
            AllTickets()
                .padding(.top , 50)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   ContentView()
                       .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                       .previewDisplayName("iPhone SE (2nd generation)")
                   
                   ContentView()
                       .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                       .previewDisplayName("iPhone 11")
               
        
    }
}
}
