

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct Uber_CloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    @StateObject var session = SessionStore()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            HomeView()
//                .environmentObject(session)
//                .environmentObject(locationViewModel)
            NavigationView {
                StarterScreen().environmentObject(session).environmentObject(locationViewModel)
            }
                
        }
    }
}
