//
//  Ticket.swift
//  Movie_Ticket_App
//
//  Created by MACPC on 02/04/24.
//

import Foundation
import SwiftUI

struct Ticket : Identifiable{
    var id = UUID().uuidString
    var image : String
    var title : String
    var subtitle : String
    var top : String
    var bottom : String
    
}
