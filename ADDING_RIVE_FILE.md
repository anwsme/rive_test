w# Adding Your wind_turbine.riv File to Xcode

## 🎯 Quick Steps

1. **Create your animation** in Rive Editor (https://rive.app)
2. **Export as `wind_turbine.riv`**
3. **Add to Xcode project** (instructions below)
4. **Run and test!**

## 📁 Method 1: Drag & Drop (Recommended)

1. Open `WindTurbineApp.xcodeproj` in Xcode
2. In Project Navigator (left sidebar), find the `WindTurbineApp` folder
3. Drag your `wind_turbine.riv` file from Finder into this folder
4. In the dialog:
   - ✅ Check "Copy items if needed"
   - ✅ Check "Add to target: WindTurbineApp"  
   - ✅ Click "Finish"

## 📁 Method 2: Add Files Menu

1. Right-click on `WindTurbineApp` folder in Project Navigator
2. Select "Add Files to 'WindTurbineApp'"
3. Navigate to and select your `.riv` file
4. Ensure:
   - ✅ "Copy items if needed" is checked
   - ✅ "WindTurbineApp" target is selected
   - ✅ Click "Add"

## ✅ Verification Checklist

After adding the file, verify:

- [ ] File appears in Project Navigator under `WindTurbineApp/`
- [ ] File is included in Build Phases → Copy Bundle Resources
- [ ] File has `.riv` extension (not `.txt` or other)
- [ ] App builds without errors

## 🎨 Creating Your Rive Animation

Your `.riv` file should have:

### Required State Machine Setup:   
- **Number Input:** `speed_blend` (range: 0.0 to 1.0)
- **Two States:** slow spinning and fast spinning
- **Transitions:** Based on `speed_blend` value

### Example State Machine:
```
WindTurbineController (State Machine)
├── slow_spin (entry state)
├── fast_spin  
├── speed_blend (Number Input: 0.0 - 1.0)
└── Transitions:
    ├── slow → fast (when speed_blend > 0.5)
    └── fast → slow (when speed_blend ≤ 0.5)
```

## 🔧 Troubleshooting

### File Not Found Error:
- Check that file is in `WindTurbineApp/` folder (not root)
- Verify target membership in File Inspector
- Clean build folder: Product → Clean Build Folder

### Animation Not Responding:
- Verify input name is exactly `speed_blend`
- Check input range is 0.0 to 1.0 in Rive Editor
- Ensure state machine is properly configured

### Build Errors:
- Make sure file extension is `.riv`
- Check that file isn't corrupted
- Try re-exporting from Rive Editor

## 🎉 Success!

Once added correctly:
- The placeholder will disappear
- Your wind turbine animation will appear
- The slider will control the animation speed
- 0% = slow spinning, 100% = fast spinning

## 📱 File Structure After Adding:

```
WindTurbineApp/
├── WindTurbineApp.swift
├── ContentView.swift  
├── WindTurbineView.swift
├── wind_turbine.riv          ← Your file here!
├── Info.plist
└── Assets.xcassets/
    ├── AppIcon.appiconset/
    └── AccentColor.colorset/
``` 