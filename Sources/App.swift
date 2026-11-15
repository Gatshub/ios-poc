import SwiftUI

@main
struct PocIosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var compteur = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Hello depuis Linux 🐧")
                .font(.title2.bold())
            Text("Compilé sur un runner macOS,\nécrit sous Omarchy.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Text("Compteur : \(compteur)")
                .font(.title.monospacedDigit())
            Button("+1") { compteur += 1 }
                .buttonStyle(.borderedProminent)
        }
        .padding(40)
    }
}
