import SwiftUI
import UIKit
import Foundation
import RiveRuntime

// AppDelegate to configure Rive Renderer for vector feathering support
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Enable Rive Renderer for vector feathering support
        print("🎯 Setting Rive Renderer as default...")
        RenderContextManager.shared().defaultRenderer = RendererType.riveRenderer
        
        // Verify the renderer was set
        let currentRenderer = RenderContextManager.shared().defaultRenderer
        print("✅ Current renderer: \(currentRenderer.rawValue)")
        print("🎨 Rive Renderer should support vector feathering!")
        
        return true
    }
}

@main
struct WindTurbineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
} 