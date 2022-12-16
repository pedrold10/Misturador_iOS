//
//  ContentView.swift
//  Misturador
//
//  Created by ifpb on 16/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        NavigationView{
            ListView()
        }
    }
    struct ContentView_Previous: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }

}
