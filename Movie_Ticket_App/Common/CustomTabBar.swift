//
//  CustomTabBar.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab : Tab
    
    var background = [Color("purple") , Color("lightBlue") , Color("pink")]
    var gradient = [Color("cyan") , Color("cyan").opacity(0.3) , Color("cyan")]
    var body: some View {
        GeometryReader { geometry in
            
            let width1 = geometry.size.width
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    Button {
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .frame(maxWidth : .infinity)
                            .foregroundColor(.white)
                            .offset(y : currentTab  == tab ? -17 : 0)
                    }

              
                }
            }
            .frame(maxWidth : .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 10)
//                    .offset(x: indicatorOffset(width: width1), y: -17)
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2))
//                            .trim(from: 0, to: CGFloat(0.5))
                    )

                    .rotationEffect(.degrees(135))
                    .frame(width: 78, height: 78)
                    .offset(x: indicatorOffset(width: width1), y: -17)
            }

        }
        .frame(height : 24)
        .padding(.top , 30)
        .background(
            LinearGradient(colors: background, startPoint: .leading, endPoint: .trailing)
        )
        
    }
    func indicatorOffset(width : CGFloat) -> CGFloat{
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .location:
            return 1
        case .ticket:
            return 2
        case .category:
            return 3
        case .profile:
            return 4
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
