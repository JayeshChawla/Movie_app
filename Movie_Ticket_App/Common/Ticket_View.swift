//
//  Ticket_View.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct Ticket_View: View {
    
    @State var title : String = "Thor"
    @State var subTitle : String = "Love and Thunder"
    @State var top : String = "thor-top"
    @State var bottom : String = "thor-bottom"
    @Binding var height : CGFloat
    
    var gradient = [Color("cyan") , Color("cyan").opacity(0), Color("cyan").opacity(3)]
    
    var body: some View {
        VStack{
            VStack{
                Text(title)
                    .fontWeight(.bold)
                Text(subTitle)
                    .multilineTextAlignment(.center)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundColor(.white)
            .background(
                Image(top)
                    .resizable()
                    .aspectRatio(contentMode : .fill)
                
            )
            .mask(
            Image("thor-top")
                .resizable()
                .aspectRatio(contentMode : .fill)
            )
            .overlay{
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth : 2))
            }
            .cornerRadius(40 , corners: [.topLeft , .topRight])
            
            Spacer(minLength: height)
            
            VStack( spacing : 10){
                Line()
                    .stroke(style: StrokeStyle(lineWidth : 2 , dash: [7]))
                    .frame(width: 200, height: 1)
                    .opacity(0.6)
                
                HStack(spacing : 20){
                HStack{
                    Text("Date:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    Text("23 April")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                }
                    HStack{
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("6 pm")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                    }
                }
                HStack(spacing : 20){
                HStack{
                    Text("Row:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    Text("2")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                }
                    HStack{
                        Text("Seats:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("6 , 7")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                    }
                }
                Image("code")
                
              
            }
            .frame(width: 250, height: 132, alignment: .top)
            .background(.ultraThinMaterial)
            .background(
            Image(bottom)
                .resizable()
                .aspectRatio(contentMode : .fill)
            )
            .mask(
            Image(bottom)
                .resizable()
                .aspectRatio(contentMode : .fill)
            )
            
            
        }
        .frame(height : 450)
        .font(.footnote)
        .shadow(radius: 10)
    }
}

struct Ticket_View_Previews: PreviewProvider {
    static var previews: some View {
        Ticket_View(height: .constant(0))
    }
}
