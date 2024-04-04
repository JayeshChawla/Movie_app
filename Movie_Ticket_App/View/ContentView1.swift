//
//  ContentView1.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import SwiftUI

struct ContentView1: View {
    
    @State var currentTab  : Tab = .home
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        NavigationView {
            VStack{
                TabView(selection : $currentTab){
                    Home()
                        .tag(Tab.home)
                    
                    Text("Location")
                        .tag(Tab.location)
                    
                    ContentView()
                        .tag(Tab.ticket)
                    
                    Text("Category")
                        .tag(Tab.category)
                    
                    Text("Profile")
                        .tag(Tab.profile)
                }
                CustomTabBar(currentTab: $currentTab)
                   
            }
//            .ignoresSafeArea(.keyboard)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline) // Hide navigation bar title
            .navigationBarHidden(true) // Hide the navigation ba
            
            
        }
        .background(Color.clear)
        
    
        
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
