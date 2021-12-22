// We are a way for the cosmos to know itself. -- C. Sagan

import Combine
import SwiftUI

class Arena: ObservableObject {
    @Published var frame: CGRect = .zero

    var xObserver: AnyCancellable?

    func postInit() {
        xObserver = $frame
            .removeDuplicates {
                $0.origin.x == $1.origin.x
            }
            .sink { [weak self] in
                guard let myself = self else { return }
                myself.frame.origin.y = $0.origin.x
                print("Writing (x: \(myself.frame.origin.x), y: \(myself.frame.origin.y))")
            }

        ping()
    }

    func ping() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) { [weak self] in
            guard let myself = self else { return }

            print("Reading (x: \(myself.frame.origin.x), y: \(myself.frame.origin.y))")
            myself.ping()
        }
    }
}
