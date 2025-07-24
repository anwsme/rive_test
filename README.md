# Wind Turbine Animation with Rive and SwiftUI

This project demonstrates how to bind a Rive animation file (.riv) to a SwiftUI slider, allowing real-time control of animation states.

## Setup Instructions

### 1. Install Rive Runtime

Add the Rive iOS runtime to your project using Swift Package Manager:

```
https://github.com/rive-app/rive-ios
```

Or if using Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/rive-app/rive-ios`
3. Click Add Package

### 2. Create Your Rive Animation

#### In Rive Editor (https://rive.app):

1. **Create your wind turbine animation** with two distinct states:
   - **Slow State**: Turbine blades rotating slowly
   - **Fast State**: Turbine blades rotating quickly

2. **Set up State Machine**:
   - Create a new State Machine
   - Add both slow and fast states
   - Create a **Number Input** called `speed_blend` (range: 0.0 to 1.0)
   
3. **Configure Transitions**:
   - Create transitions between slow and fast states
   - Use the `speed_blend` input to control the blending
   - Set transition conditions based on the input value

4. **Export as .riv file**:
   - Save your file as `wind_turbine.riv`
   - Place it in your Xcode project bundle

### 3. Add Rive File to Xcode Project

1. Drag `wind_turbine.riv` into your Xcode project
2. Make sure "Add to target" is checked
3. Ensure the file appears in your app bundle

### 4. Rive Editor Configuration Details

#### State Machine Setup:
```
State Machine: "WindTurbineController"
├── States:
│   ├── "slow_spin" (idle/entry state)
│   └── "fast_spin"
├── Inputs:
│   └── "speed_blend" (Number, 0.0 - 1.0)
└── Transitions:
    ├── slow_spin → fast_spin (when speed_blend > 0.5)
    └── fast_spin → slow_spin (when speed_blend ≤ 0.5)
```

#### Alternative: Blend States Approach
For smoother transitions, you can use a single state with a blend tree:
1. Create a single state with multiple animations
2. Use `speed_blend` input to control animation mixing
3. Blend between slow and fast rotation animations

### 5. Key Code Components

#### Main Binding Logic:
```swift
// Convert slider value (0-100) to blend value (0.0-1.0)
let blendValue = Float(value / 100.0)

// Update Rive animation input
riveViewModel.setInput("speed_blend", value: blendValue)
```

#### SwiftUI Slider:
```swift
Slider(value: $speedValue, in: 0...100, step: 1)
    .onChange(of: speedValue) { oldValue, newValue in
        updateAnimationSpeed(newValue)
    }
```

## Usage

1. Run the app
2. Use the slider to control wind turbine speed
3. 0% = Slow spinning
4. 100% = Fast spinning
5. Values in between create smooth blending

## Customization

### Modify Animation Response:
- Change the `speed_blend` input name in both Rive and Swift code
- Adjust slider range and step values
- Add easing functions for smoother transitions

### Add More States:
- Create additional animation states in Rive
- Add more inputs for different parameters (direction, intensity, etc.)
- Extend the Swift code to handle multiple inputs

### Visual Enhancements:
- Add particle effects for wind
- Include sound effects that change with speed
- Add background animations that respond to turbine speed

## Troubleshooting

### Common Issues:

1. **Animation not responding to slider**:
   - Check that input name matches exactly (`speed_blend`)
   - Verify the input range (0.0-1.0) in Rive Editor
   - Ensure state machine is properly configured

2. **Rive file not loading**:
   - Confirm file is added to Xcode target
   - Check file name matches (`wind_turbine.riv`)
   - Verify file is in app bundle

3. **Jerky transitions**:
   - Use blend states instead of discrete state transitions
   - Add easing curves in Rive Editor
   - Consider using continuous animations rather than discrete states

## File Structure

```
Wind Turbine/
├── WindTurbineApp.swift      # Main app entry point
├── ContentView.swift         # Root content view
├── WindTurbineView.swift     # Main turbine control view
├── wind_turbine.riv         # Rive animation file
└── README.md                # This file
```

## Next Steps

1. Create your wind turbine animation in Rive Editor
2. Export as `wind_turbine.riv`
3. Add the file to your Xcode project
4. Run the app and test the slider functionality
5. Customize the animation and UI as needed 