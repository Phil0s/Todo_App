//
//  Phillip_ToDoApp.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 30/8/21.
//

import SwiftUI

//Why do I keep getting an error message when I shut down Simulator here? Further Investigation needed
@main
struct Phillip_ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
