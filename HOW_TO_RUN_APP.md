# How to Run Your Wind Turbine iOS App

You now have a complete iOS app structure! Here's how to open and run it:

## 🚀 Quick Start

### 1. Open in Xcode
```bash
open WindTurbineApp.xcodeproj
```

Or in Finder:
- Navigate to your project folder
- Double-click on `WindTurbineApp.xcodeproj`

### 2. Add Rive Dependency (First Time Only)
When Xcode opens, it should automatically resolve the Rive package dependency. If not:

1. In Xcode: **File** → **Add Package Dependencies**
2. Enter: `https://github.com/rive-app/rive-ios`
3. Click **Add Package**
4. Select **RiveRuntime** and click **Add Package**

### 3. Run the App
1. Select a simulator (iPhone 15 Pro recommended)
2. Press **⌘ + R** or click the **Play** button
3. The app will build and launch in the simulator

## 📱 App Structure

Your complete app now includes:

```
WindTurbineApp.xcodeproj/          # Xcode project file
WindTurbineApp/                    # App source folder
├── WindTurbineApp.swift          # Main app entry point
├── ContentView.swift             # Root view
├── WindTurbineView.swift         # Main turbine control view
├── wind_turbine.riv             # Your Rive animation (placeholder)
├── Info.plist                   # App configuration
└── Assets.xcassets/             # App assets
    ├── AppIcon.appiconset/      # App icon
    └── AccentColor.colorset/    # App accent color
```

## 🎨 Next Steps

### Replace the Placeholder Rive File

1. **Create your animation** in Rive Editor (https://rive.app):
   - Design a wind turbine with rotating blades
   - Create two animation states: slow and fast spinning
   - Add a **Number Input** named `speed_blend` (range: 0.0 to 1.0)
   - Set up state transitions or blending based on this input

2. **Export and replace**:
   - Export your animation as `wind_turbine.riv`
   - Replace the placeholder file in `WindTurbineApp/wind_turbine.riv`

3. **Test the app**:
   - Run the app again
   - Use the slider to control the animation
   - 0% = slow spinning, 100% = fast spinning

## 🛠 Customization Options

### Change the Rive Input Name
If you named your input differently in Rive, update this line in `WindTurbineView.swift`:
```swift
riveViewModel.setInput("speed_blend", value: blendValue)
```

### Modify the UI
- Adjust slider range, colors, or layout in `WindTurbineView.swift`
- Change app icon by adding images to `Assets.xcassets/AppIcon.appiconset/`
- Modify accent color in `Assets.xcassets/AccentColor.colorset/Contents.json`

### Add More Features
- Multiple animation inputs (direction, intensity, etc.)
- Sound effects that change with speed
- Background animations
- Settings screen

## 🔧 Troubleshooting

### Common Issues:

1. **"Cannot find RiveRuntime in scope"**
   - Make sure the Rive package is properly added
   - Clean build folder: **Product** → **Clean Build Folder**

2. **App crashes on launch**
   - Check that `wind_turbine.riv` exists in the app bundle
   - Verify the Rive file is properly formatted

3. **Slider doesn't affect animation**
   - Ensure your Rive file has a Number Input named `speed_blend`
   - Check that the input range is 0.0 to 1.0
   - Verify state machine configuration in Rive

4. **Build errors**
   - Make sure deployment target is iOS 15.0 or later
   - Check that all Swift files are added to the target

## 🎉 You're Ready!

Your iOS app is now complete and ready to run! The slider will control your wind turbine animation in real-time once you add your Rive file.

**Key Features:**
- ✅ Real-time slider-to-animation binding
- ✅ Smooth interpolation between animation states  
- ✅ Modern SwiftUI interface
- ✅ iPhone and iPad support
- ✅ Rive Runtime integration
- ✅ Haptic feedback at min/max values 