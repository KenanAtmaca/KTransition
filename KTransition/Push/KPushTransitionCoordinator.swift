//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

final public class KPushTransitionCoordinator: NSObject, UINavigationControllerDelegate {
    
    var animator:KTransitionAnimator? = {
        let animatorObj = KTransitionAnimator()
        return animatorObj
    }()
    
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            animator?.isPresent = true
            return animator
        case .pop:
            animator?.isPresent = false
            return animator
        default:
            return nil
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
