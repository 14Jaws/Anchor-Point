import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

// ---- Home tab ----
struct HomeView: View {
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Welcome to Anchor Point")
                    .font(.title).bold()

                Button("Show Alert") {
                    showAlert = true
                }
                .font(.headline)
                .padding(.vertical, 14)
                .padding(.horizontal, 24)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                NavigationLink("Open Demo Screen") {
                    DemoView()
                }
                .font(.headline)
            }
            .padding()
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") { print("Save tapped") }
                }
            }
            .alert("It works!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

// ---- A second screen to prove navigation works ----
struct DemoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Demo Screen").font(.title).bold()
            Text("Now your app has a Home tab and Settings tab.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Demo")
    }
}

// ---- Settings tab ----
struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("About")) {
                    Text("Version 0.1")
                    Text("Built by Trudy 💙")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview { ContentView() }
