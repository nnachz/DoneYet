//
//  DoneYetApp.swift
//  DoneYet
//
//  Created by Kerem Türközü on 23.10.2024.
//

import SwiftUI

@main
struct DoneYetApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
