// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

@main
struct VaiApp: App {
    @ObservedObject var arena = Arena()

    var body: some Scene {
        WindowGroup {
            ContentView(arena: arena).onAppear { arena.postInit() }
        }
    }
}
