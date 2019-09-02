# KTransition

<br><p align="center">
<img src="https://user-images.githubusercontent.com/16580898/64100900-48eefb80-cd75-11e9-94ea-7da53c6b1f1a.gif" width="15%"/> 
<img src="https://user-images.githubusercontent.com/16580898/64100929-5c9a6200-cd75-11e9-9c8c-a2109f72291b.gif" width="15%"/>
<img src="https://user-images.githubusercontent.com/16580898/64100962-6c19ab00-cd75-11e9-99f7-b8232e8e606f.gif" width="15%"/>
<img src="https://user-images.githubusercontent.com/16580898/64100992-79369a00-cd75-11e9-8d78-ac827dd386b3.gif" width="15%"/>
<img src="https://user-images.githubusercontent.com/16580898/64101014-89e71000-cd75-11e9-805a-c94efe097f94.gif" width="15%"/>
</p>

<p align="center">
  <img alt="MIT Licance" src="https://img.shields.io/github/license/KenanAtmaca/KTransition"/>
  <img alt="Pod" src="https://img.shields.io/cocoapods/v/KTransition"/>
  <img alt="Platform" src="https://img.shields.io/cocoapods/p/KTransition">
  <img alt="Tag" src="https://img.shields.io/github/v/tag/KenanAtmaca/KTransition"/>
  <img alt="Swift" src="https://img.shields.io/badge/Swift-4.2%2B-orange"/>
</p>

## Requirements

- Xcode 9.0 +
- iOS 11.0 or greater

## Installation

### CocoaPods

1. Install [CocoaPods](http://cocoapods.org)
2. Add this repo to your `Podfile`

```ruby
platform :ios, '11.0'

target 'ProjectName' do
  use_frameworks!
  pod 'KTransition'
end
```

3. Run `pod install`
4. Open up the new `.xcworkspace` that CocoaPods generated
5. Whenever you want to use the library: `import KTransition`

### Manually

1. Simply download the `KTransition` source files and import them into your project.

## Usage

- Navigation Push & Pop

```Swift
self.navigationController?.customPushTransition = KTransition.push(style: .top, duration: 0.5)
```

- ViewController Present & Dismiss

```Swift
let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OtherVC") as! OtherVC
vc.customPresentTransition = KTransition.present(style: .scale, duration: 0.5, startFrame: nil)
self.present(vc, animated: true, completion: nil)
```

- Touch and start in location animate

```Swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   let touch = touches.first!
   let location = touch.location(in: self.view)

   let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OtherVC") as! OtherVC
   vc.customPresentTransition = KTransition.present(style: .bounds, duration: 0.5, startFrame: location)
   self.present(vc, animated: true, completion: nil)
 }
```

### Animate styles
- [X] Alpha
- [X] Scale
- [X] Top
- [X] Left
- [X] Bounds

## License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.
