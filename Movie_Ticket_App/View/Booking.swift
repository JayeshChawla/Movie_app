//
//  Booking.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct Booking: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2") , Color("backgroundColor2") , Color("backgroundColor2")]
    
    @State var selectedDate : Bool = false
    @State var bindingSelection : Bool = false
    @State var selectedHour : Bool = false
    
 
    var body: some View {
        NavigationView {
            ZStack{
                Image("booking")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(maxHeight : .infinity , alignment: .top)
                
                VStack{
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height : 600)
                }
                .frame(maxHeight : .infinity , alignment: .bottom)
                
                VStack{
                    HStack{
                        CircleButton(action: {presentationMode.wrappedValue.dismiss()}, image: "arrow.left")
                        
                        Spacer()
                        
                        CircleButton(action: {}, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top , 150)
                    
                    Text("in the Multiverse and Madness")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of...")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text("Select Date and Time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    HStack(alignment : .top , spacing: 20){
                        DateButton(weekDay : "Thu" , numDay: "21" , isSelected: $bindingSelection)
                            .padding(.top , 90)
                        
                        DateButton(weekDay : "Fri" , numDay: "22" , isSelected: $bindingSelection)
                            .padding(.top , 70)
                        
                        DateButton(weekDay : "Sat" , numDay: "23", width: 70 , height: 100 , isSelected: $selectedDate) {
                            withAnimation(.spring()){
                                selectedDate.toggle()
                            }
                        }
                        .padding(.top , 30)
                        
                        DateButton(weekDay : "Sun" , numDay: "24" , isSelected: $bindingSelection)
                            .padding(.top , 70)
                        
                        DateButton(weekDay : "Mon" , numDay: "25" , isSelected: $bindingSelection)
                            .padding(.top , 90)
                        
                    }
                    HStack(alignment : .top , spacing: 20){
                        TimeButton(hour : "16:00" , isSelected: $bindingSelection)
                            .padding(.top , 20)
                        TimeButton(hour : "16:00" , isSelected: $bindingSelection)
                        TimeButton(hour : "16:00" ,width: 70 , height: 40 , isSelected: $selectedHour) {
                            withAnimation(.spring()){
                                selectedHour.toggle()
                            }
                        }
                        .padding(.top , -20)
                        TimeButton(hour : "16:00" , isSelected: $bindingSelection)
                        TimeButton(hour : "16:00" , isSelected: $bindingSelection)
                            .padding(.top , 20)
                    }
                    
                    
                    NavigationLink {
                        Text("seats")
                    } label: {
                        LargeButton()
                            .padding(20)
                            .offset(y : selectedHour && selectedDate ? 0 : 200)
                    }

                    
                    
                }
                .frame(maxHeight : .infinity , alignment: .top)
                .padding(.bottom )
                
            }
            .background(Color("backgroundColor2"))
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct Booking_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   Booking()
                       .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                       .previewDisplayName("iPhone SE (2nd generation)")
                   
                   Booking()
                       .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                       .previewDisplayName("iPhone 11")
               
        
    }
    }
}
