import SwiftUI
import RiveRuntime

// MARK: - Rive Model for Wind Turbine Animation
class WindTurbineRiveModel: RiveViewModel {
    
    init() {
        print("🚀 Initializing WindTurbineRiveModel...")
        print("📂 Loading: electro_final.riv")
        print("🎨 Using default artboard (first one)")
        
        // Using electro_final.riv (make sure it's added to Xcode project target!)
        super.init(fileName: "electro_final")
        
        // Check if file exists
        if Bundle.main.url(forResource: "electro_final", withExtension: "riv") != nil {
            print("✅ electro_final.riv file found in bundle")
        } else {
            print("❌ electro_final.riv file NOT found in bundle")
        }
        
        print("🎯 Current renderer: \(RenderContextManager.shared().defaultRenderer.rawValue)")
    }
    
    override func setView(_ view: RiveView) {
        super.setView(view)
        view.playerDelegate = self
        view.stateMachineDelegate = self
        
        print("🔗 RiveView delegates set")
        print("🎨 View renderer: \(RenderContextManager.shared().defaultRenderer.rawValue)")
        print("✅ RiveView setup completed")
    }
    
    // Add player delegate methods to track loading
    override func player(playedWithModel riveModel: RiveModel?) {
        print("▶️ Animation started playing")
        if let model = riveModel {
            print("📊 Model loaded successfully")
        }
    }
}

// MARK: - SwiftUI View
struct WindTurbineView: View {
    @StateObject private var riveModel = WindTurbineRiveModel()
    
    var body: some View {
        // Full screen Rive animation
        riveModel.view()
            .ignoresSafeArea()
            .onAppear {
                print("🎬 WindTurbineView appeared")
                print("🎨 Final renderer check: \(RenderContextManager.shared().defaultRenderer.rawValue)")
            }
    }
}

// MARK: - Preview
struct WindTurbineView_Previews: PreviewProvider {
    static var previews: some View {
        WindTurbineView()
    }
} 
