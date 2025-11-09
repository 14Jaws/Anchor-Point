import SwiftUI

// MARK: - App Root (Tab Bar)
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }

            ScenariosView()
                .tabItem { Label("Scenarios", systemImage: "list.bullet.rectangle") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}

// MARK: - Home Tab
struct HomeView: View {
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to Anchor Point")
                    .font(.title).bold()
                    .multilineTextAlignment(.center)

                Button("Show Alert") { showAlert = true }
                    .font(.headline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
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

struct DemoView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Demo Screen").font(.title).bold()
            Text("Now your app has a Home, Scenarios, and Settings tab.")
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("Demo")
    }
}

// MARK: - Scenarios Tab
struct Scenario: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let age: String
    let goal: String
    let steps: [String]
}

struct ScenariosView: View {
    // starter sample data you can edit
    @State private var scenarios: [Scenario] = [
        Scenario(
            title: "Big Feelings (Meltdown)",
            age: "Age 8–10",
            goal: "Help the child regulate and feel safe",
            steps: [
                "Breathe first (you): in 4, out 6, 3 times.",
                "Lower your voice. Kneel to their eye level.",
                "Name what you see: “Your body looks tight. You’re upset.”",
                "Offer 2 choices: water or quiet corner.",
                "After calm: short praise for any positive step."
            ]
        ),
        Scenario(
            title: "Refusing to Transition",
            age: "Age 6–12",
            goal: "Move to the next task without a power struggle",
            steps: [
                "Give a heads-up: “2 minutes, then shoes on.”",
                "Use a when/then: “When shoes are on, then playground.”",
                "Offer a helper role: “Can you be the line leader?”",
                "If stuck, shrink the task: “One shoe first.”",
                "Catch the first small success: “Nice start!”"
            ]
        ),
        Scenario(
            title: "Anxiety Spike at School",
            age: "Age 10–14",
            goal: "Reduce anxiety and return to baseline",
            steps: [
                "Validate: “This feels a lot right now.”",
                "5-4-3-2-1 grounding (look, feel, hear, smell, taste).",
                "Box-breathing together (4–4–4–4).",
                "Offer a script: “I can ask for help or take 2 min.”",
                "Plan the very next tiny step together."
            ]
        )
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Tap a scenario") {
                    ForEach(scenarios) { s in
                        NavigationLink(value: s) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(s.title).font(.headline)
                                Text("\(s.age) • \(s.goal)").font(.subheadline).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Scenarios")
            .navigationDestination(for: Scenario.self) { scenario in
                ScenarioDetailView(scenario: scenario)
            }
        }
    }
}

struct ScenarioDetailView: View {
    let scenario: Scenario

    var body: some View {
        List {
            Section("Goal") { Text(scenario.goal) }
            Section("Steps (follow in order)") {
                ForEach(Array(scenario.steps.enumerated()), id: \.offset) { idx, step in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\(idx + 1).").bold().frame(width: 24, alignment: .trailing)
                        Text(step)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle(scenario.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Settings Tab
struct SettingsView: View {
    @AppStorage("showTips") private var showTips = true

    var body: some View {
        NavigationStack {
            Form {
                Section("Preferences") {
                    Toggle("Show tips & reminders", isOn: $showTips)
                }
                Section("About") {
                    Text("Version 0.1")
                    Text("Built by Trudy 💙")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview { ContentView() }
