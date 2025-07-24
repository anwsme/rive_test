import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WindTurbineView()
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
} 