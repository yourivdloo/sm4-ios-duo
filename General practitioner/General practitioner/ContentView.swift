//
//  ContentView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body : some View{
        TabView {
            BodyView()
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Home")
                }
            GPMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("GPs near you")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
