//
//  UIViewGestureExtensions.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 23/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

/* To use
 
 view.addSingleTapGestureRecognizerWithResponder({ [unowned self] -> Void in
 print("Tapped: (tap)")
 self.myLabel.text = "myText"
 })
 
 As of Swift 2 you need to add [unowned self] in order to avoid strong references with self. causing memory leaks
 */


extension UIView {

    typealias TapResponseClosure = (_ tap: UITapGestureRecognizer) -> Void
    typealias PanResponseClosure = (_ pan: UIPanGestureRecognizer) -> Void
    typealias SwipeResponseClosure = (_ swipe: UISwipeGestureRecognizer) -> Void
    typealias PinchResponseClosure = (_ pinch: UIPinchGestureRecognizer) -> Void
    typealias LongPressResponseClosure = (_ longPress: UILongPressGestureRecognizer) -> Void
    typealias RotationResponseClosure = (_ rotation: UIRotationGestureRecognizer) -> Void
    
    private struct ClosureStorage {
        static var TapClosureStorage: [UITapGestureRecognizer : TapResponseClosure] = [:]
        static var PanClosureStorage: [UIPanGestureRecognizer : PanResponseClosure] = [:]
        static var SwipeClosureStorage: [UISwipeGestureRecognizer : SwipeResponseClosure] = [:]
        static var PinchClosureStorage: [UIPinchGestureRecognizer : PinchResponseClosure] = [:]
        static var LongPressClosureStorage: [UILongPressGestureRecognizer: LongPressResponseClosure] = [:]
        static var RotationClosureStorage: [UIRotationGestureRecognizer: RotationResponseClosure] = [:]
    }
    
    private struct Swizzler {
      //  private static var OnceToken : dispatch_once_t = 0
        
        static let shareInstance =  Swizzler()
        static func Swizzle() {
           // dispatch_once(&OnceToken) {
                let UIViewClass: AnyClass! = NSClassFromString("UIView")
            let originalSelector = #selector(UIView.removeFromSuperview)
            let swizzleSelector = Selector(("swizzled_removeFromSuperview"))
            let original: Method = class_getInstanceMethod(UIViewClass, originalSelector)!
            let swizzle: Method = class_getInstanceMethod(UIViewClass, swizzleSelector)!
                method_exchangeImplementations(original, swizzle)
          //  }
        }
    }
    
    func swizzled_removeFromSuperview() {
        self.removeGestureRecognizersFromStorage()
        /*
         Will call the original representation of removeFromSuperview, not endless cycle:
         http://darkdust.net/writings/objective-c/method-swizzling
         */
        self.swizzled_removeFromSuperview()
    }
    
    func removeGestureRecognizersFromStorage() {
        if let gestureRecognizers = self.gestureRecognizers {
            for recognizer: UIGestureRecognizer in gestureRecognizers as [UIGestureRecognizer] {
                if let tap = recognizer as? UITapGestureRecognizer {
                    ClosureStorage.TapClosureStorage[tap] = nil
                }
                else if let pan = recognizer as? UIPanGestureRecognizer {
                    ClosureStorage.PanClosureStorage[pan] = nil
                }
                else if let swipe = recognizer as? UISwipeGestureRecognizer {
                    ClosureStorage.SwipeClosureStorage[swipe] = nil
                }
                else if let pinch = recognizer as? UIPinchGestureRecognizer {
                    ClosureStorage.PinchClosureStorage[pinch] = nil
                }
                else if let rotation = recognizer as? UIRotationGestureRecognizer {
                    ClosureStorage.RotationClosureStorage[rotation] = nil
                }
                else if let longPress = recognizer as? UILongPressGestureRecognizer {
                    ClosureStorage.LongPressClosureStorage[longPress] = nil
                }
            }
        }
    }
    
    // MARK: Taps
    func addSingleTapGestureRecognizerWithResponder(responder: @escaping TapResponseClosure) {
        self.addTapGestureRecognizerForNumberOfTaps(withResponder: responder)
    }
    
    func addDoubleTapGestureRecognizerWithResponder(responder: @escaping TapResponseClosure) {
        self.addTapGestureRecognizerForNumberOfTaps(numberOfTaps: 2, withResponder: responder)
    }
    
    func addTapGestureRecognizerForNumberOfTaps(numberOfTaps: Int = 1, numberOfTouches: Int = 1, withResponder responder: @escaping TapResponseClosure) {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = numberOfTaps
        tap.numberOfTouchesRequired = numberOfTouches
        tap.addTarget(self, action: Selector(("handleTap:")))
        self.addGestureRecognizer(tap)
        
        ClosureStorage.TapClosureStorage[tap] = responder
        Swizzler.Swizzle()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if let closureForTap = ClosureStorage.TapClosureStorage[sender] {
            closureForTap(sender)
        }
    }
    
    // MARK: Pans
    func addSingleTouchPanGestureRecognizerWithResponder(responder: @escaping PanResponseClosure) {
        self.addPanGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    
    func addDoubleTouchPanGestureRecognizerWithResponder(responder: @escaping PanResponseClosure) {
        self.addPanGestureRecognizerForNumberOfTouches(numberOfTouches: 2, withResponder: responder)
    }
    func addPanGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping PanResponseClosure) {
        let pan = UIPanGestureRecognizer()
        pan.minimumNumberOfTouches = numberOfTouches
        pan.addTarget(self, action: Selector(("handlePan:")))
        self.addGestureRecognizer(pan)
        
        ClosureStorage.PanClosureStorage[pan] = responder
        Swizzler.Swizzle()
    }
    
     @objc func handlePan(sender: UIPanGestureRecognizer) {
        if let closureForPan = ClosureStorage.PanClosureStorage[sender] {
            closureForPan(sender)
        }
    }
    
    // MARK: Swipes
    func addLeftSwipeGestureRecognizerWithResponder(responder: @escaping SwipeResponseClosure) {
        self.addLeftSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    func addLeftSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping SwipeResponseClosure) {
        self.addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: numberOfTouches, forSwipeDirection: .left, withResponder: responder)
    }
    
    func addRightSwipeGestureRecognizerWithResponder(responder: @escaping SwipeResponseClosure) {
        self.addRightSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    func addRightSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping SwipeResponseClosure) {
        self.addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: numberOfTouches, forSwipeDirection: .right, withResponder: responder)
    }
    
    func addUpSwipeGestureRecognizerWithResponder(responder: @escaping SwipeResponseClosure) {
        self.addUpSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    func addUpSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping SwipeResponseClosure) {
        self.addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: numberOfTouches, forSwipeDirection: .up, withResponder: responder)
    }
    
    func addDownSwipeGestureRecognizerWithResponder(responder: @escaping SwipeResponseClosure) {
        self.addDownSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    func addDownSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping SwipeResponseClosure) {
        self.addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: numberOfTouches, forSwipeDirection: .down, withResponder: responder)
    }
    
    func addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, forSwipeDirection swipeDirection: UISwipeGestureRecognizerDirection, withResponder responder: @escaping SwipeResponseClosure) {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = swipeDirection
        swipe.numberOfTouchesRequired = numberOfTouches
        swipe.addTarget(self, action: Selector(("handleSwipe:")))
        self.addGestureRecognizer(swipe)
        
        ClosureStorage.SwipeClosureStorage[swipe] = responder
        Swizzler.Swizzle()
    }
    
     @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if let closureForSwipe = ClosureStorage.SwipeClosureStorage[sender] {
            closureForSwipe(sender)
        }
    }
    
    // MARK: Pinches
    func addPinchGestureRecognizerWithResponder(responder: @escaping PinchResponseClosure) {
        let pinch = UIPinchGestureRecognizer()
        pinch.addTarget(self, action: Selector(("handlePinch:")))
        self.addGestureRecognizer(pinch)
        
        ClosureStorage.PinchClosureStorage[pinch] = responder
        Swizzler.Swizzle()
    }
    
    func handlePinch(sender: UIPinchGestureRecognizer) {
        if let closureForPinch = ClosureStorage.PinchClosureStorage[sender] {
            closureForPinch(sender)
        }
    }
    
    // MARK: LongPress
    func addLongPressGestureRecognizerWithResponder(responder: @escaping LongPressResponseClosure) {
        self.addLongPressGestureRecognizerForNumberOfTouches(numberOfTouches: 1, withResponder: responder)
    }
    func addLongPressGestureRecognizerForNumberOfTouches(numberOfTouches: Int, withResponder responder: @escaping LongPressResponseClosure) {
        let longPress = UILongPressGestureRecognizer()
        longPress.numberOfTouchesRequired = numberOfTouches
        longPress.addTarget(self, action: Selector(("handleLongPress:")))
        self.addGestureRecognizer(longPress)
        
        ClosureStorage.LongPressClosureStorage[longPress] = responder
        Swizzler.Swizzle()
    }
    
     @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if let closureForLongPinch = ClosureStorage.LongPressClosureStorage[sender] {
            closureForLongPinch(sender)
        }
    }
    
    // MARK: Rotation
    func addRotationGestureRecognizerWithResponder(responder: @escaping RotationResponseClosure) {
        let rotation = UIRotationGestureRecognizer()
        rotation.addTarget(self, action: Selector(("handleRotation:")))
        self.addGestureRecognizer(rotation)
        
        ClosureStorage.RotationClosureStorage[rotation] = responder
        Swizzler.Swizzle()
    }
    
    func handleRotation(sender: UIRotationGestureRecognizer) {
        if let closureForRotation = ClosureStorage.RotationClosureStorage[sender] {
            closureForRotation(sender)
        }
    }
}
