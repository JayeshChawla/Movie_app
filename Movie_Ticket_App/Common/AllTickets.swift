//
//  AllTickets.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct AllTickets: View {
    
    
    @State var tickets : [Ticket] = [
       Ticket( image: "thor", title: "Thor", subtitle: "Love and Thunder ", top: "thor-top", bottom: "thor-bottom"),
       Ticket( image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
       Ticket( image: "scarlet", title: "Doctor - Strange", subtitle: "in the multiverse of the madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]

    var body: some View {
        ZStack{
            ForEach(tickets){ ticket in
                InfiniteStackView( tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth : .infinity , maxHeight: .infinity)
    }
}

struct AllTickets_Previews: PreviewProvider {
    static var previews: some View {
        AllTickets()
    }
}

struct InfiniteStackView : View{
    
    @GestureState var isDragging : Bool = false
    @State var offset : CGFloat = .zero
    
    @State var height : CGFloat = 0
    @Binding  var tickets : [Ticket]
    
    var ticket : Ticket
    var body: some View{
        VStack{
            Ticket_View(title : ticket.title , subTitle: ticket.subtitle, top : ticket.top , bottom : ticket.bottom , height: $height)
        }
        .frame(maxWidth : .infinity , maxHeight: .infinity)
        .zIndex(getIndex() == 0 && offset > 100 ?  Double(CGFloat(tickets.count) - getIndex()) - 1 :  Double(CGFloat(tickets.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .rotationEffect(getIndex() == 1 ? .degrees(-6) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1 : 0.9)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x : getIndex() == 2 ? 40 : 0)
        .offset(x : offset)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out , _ in
                    out = true
                    
                })
                .onChanged({ value in
                    var translation = value.translation.width
                    translation = tickets.first?.id == ticket.id ? translation : 0
                    translation = isDragging ? translation : 0
                    
                    withAnimation(.easeInOut(duration: 0.5)){
                        offset = translation
                        height = -offset/5
                       
                    }
                })
                .onEnded({ value in
                    let width = UIScreen.main.bounds.width
                    let swipedRight = offset > (width / 2)
                    let swipedLeft = -offset > (width / 2)
                    withAnimation(.easeInOut(duration: 0.5)){
                        
                        if swipedLeft{
                            offset = -width
                            removeTicket()
                        } else {
                            if swipedRight{
                                offset = width
                                removeAndadd()
                            }
                            else{
                                offset = .zero
                                height = .zero
                            }
                        }
                        
                        
                    }
                })
        )
    }
    func getIndex() -> CGFloat{
        let index = tickets.firstIndex { ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        return CGFloat(index)
    }
    func getRotation(angle : Double) -> Double{
        let width = UIScreen.main.bounds.width
        let progress = offset/width
        
        return Double(progress * angle)
    }
    func removeAndadd(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            var updateTicket = ticket
            updateTicket.id = UUID().uuidString
            
            tickets.append(updateTicket)
            withAnimation(.spring()){
                tickets.removeFirst()
            }
        }
    }
    func removeTicket(){
        withAnimation(.spring()){
            tickets.removeFirst()
        }
    }
}
