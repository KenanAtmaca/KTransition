//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    static private var transitionKey = "UINav.KPushTransitionCoordinator"
    
    public var customPushTransition:KPushTransitionCoordinator? {
        get {
            return objc_getAssociatedObject(self, &UINavigationController.transitionKey) as? KPushTransitionCoordinator
        }
        set {
            objc_setAssociatedObject(self, &UINavigationController.transitionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setCustomTransition()
        }
    }
    
    private func setCustomTransition() {
        guard customPushTransition != nil else { return }
        delegate = customPushTransition
        
        let edgeSwipeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        edgeSwipeGestureRecognizer.edges = .left
        view.addGestureRecognizer(edgeSwipeGestureRecognizer)
    }
    
    @objc private func handleSwipe(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        guard let gestureRecognizerView = gestureRecognizer.view else {
            customPushTransition?.interactionController = nil
            return
        }
        
        let percent = gestureRecognizer.translation(in: gestureRecognizerView).x / gestureRecognizerView.bounds.size.width
        
        if gestureRecognizer.state == .began {
            customPushTransition?.interactionController = UIPercentDrivenInteractiveTransition()
            popViewController(animated: true)
        } else if gestureRecognizer.state == .changed {
            customPushTransition?.interactionController?.update(percent)
        } else if gestureRecognizer.state == .ended {
            if percent > 0.5 && gestureRecognizer.state != .cancelled {
                customPushTransition?.interactionController?.finish()
                customPushTransition?.animator?.interactionState = true
            } else {
                customPushTransition?.interactionController?.cancel()
                customPushTransition?.animator?.interactionState = false
            }
            customPushTransition?.interactionController = nil
        }
    }
}
