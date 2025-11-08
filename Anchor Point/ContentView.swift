import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Welcome to Anchor Point")
                    .font(.title).bold()

                // Big button you can tap
                Button {
                    showAlert = true
                } label: {
                    Text("Show Alert")
                        .font(.headline)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 24)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                // Go to another screen
                NavigationLink("Open Demo Screen") {
                    DemoView()
                }
                .font(.headline)
            }
            .padding()
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        print("Save tapped")
                    }
                }
            }
            .alert("It works!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

// A second screen to prove navigation works
struct DemoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Demo Screen")
                .font(.title).bold()
            Text("Now your app has more than just 'Hello'.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Demo")
    }
}

#Preview {
    ContentView()
}
