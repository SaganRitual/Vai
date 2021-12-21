// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct ContentView: View {
    @ObservedObject var arena: Arena

    func bind() -> Binding<Double> {
        Binding(
            get: { arena.frame.origin.x },
            set: {
                arena.frame.origin.x = $0
                print("Binding (x: \(arena.frame.origin.x), y: \(arena.frame.origin.y))")
            }
        )
    }

    var body: some View {
        Slider(
            value: bind(), in: -1.0...1.0,
            label: { Text("Origin.x \(arena.frame.origin.x)") }
        )
    }
}
