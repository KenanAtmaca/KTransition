//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static var transitionKey = "UIVC.KPresentTansitionCoordinator"
    
    public var customPresentTransition:KPresentTransitionCoordinator? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.transitionKey) as? KPresentTransitionCoordinator
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.transitionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setCustomTransition()
        }
    }
    
    private func setCustomTransition() {
        guard customPresentTransition != nil else { return }
        self.transitioningDelegate = customPresentTransition
        self.modalPresentationStyle = .custom
        self.modalPresentationCapturesStatusBarAppearance = true
    }
}
