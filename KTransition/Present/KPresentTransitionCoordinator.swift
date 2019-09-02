//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

public final class KPresentTransitionCoordinator:NSObject, UIViewControllerTransitioningDelegate {
    
    var animator:KTransitionAnimator? = {
       let animatorObj = KTransitionAnimator()
       return animatorObj
    }()
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator?.isPresent = true
        return animator
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator?.isPresent = false
        return animator
    }
}
