//
//  Seats.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct Seats: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var aninmate : Bool = false
    
    var body: some View {
        VStack{
            HStack{
                CircleButton(action: {presentationMode.wrappedValue.dismiss()}, image: "arrow.left")
                
                Spacer()
                Text("Choose Seats")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
            }
            .padding(.top , 45)
            .padding(.horizontal , 20)
            
            Image("frontSeat")
                .padding(.top, 40)
                .glow(color: .pink, radius: 20)
            
            Image("seats")
                .padding(.top , 50)
                .padding(.horizontal , 20)
            
            HStack(spacing : 20){
                StatusUI()
                
                StatusUI(color: Color("majenta"), text: "Reserved")
                
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            .padding(.top , 30)
            
            ZStack(alignment: .topLeading) {
                
                Circle()
                    .frame(width : 200 , height: 230)
                    .foregroundColor(Color("purple"))
                    .blur(radius: aninmate ? 70 : 100)
                    .offset(x : aninmate ? -100 : 20 , y : aninmate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()){
                            aninmate.toggle()
                        }
                    }
                VStack(alignment : .leading){
                    HStack(spacing : 10){
                        Image(systemName: "calendar")
                        Text("April 28 , 2022")
                        Circle()
                            .frame(width : 6  , height: 6)
                        Text("Seats 9 , 10")
                        
                    }
                    HStack(spacing : 10){
                        Image(systemName: "ticket.fill")
                        Text("Vip Section")
                        Circle()
                            .frame(width : 6  , height: 6)
                        Text("Seats 9 , 10")
                        
                    }
                    HStack(spacing : 10){
                        Image(systemName: "cart.fill")
                        Text("Total : $30")
                    }
                }
                .padding(30)
                .font(.subheadline)
            }
            .frame(maxWidth : .infinity , maxHeight: .infinity , alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top , 20)
        }
        .frame(maxWidth : .infinity ,maxHeight : .infinity , alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct Seats_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   Seats()
                       .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                       .previewDisplayName("iPhone SE (2nd generation)")
                   
                   Seats()
                       .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                       .previewDisplayName("iPhone 11")
               
        
    }
    }
}
