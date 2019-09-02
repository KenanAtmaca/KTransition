//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

class KTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var context:UIViewControllerContextTransitioning!
    private var fromView:UIView!
    private var toView:UIView!
    
    var isPresent: Bool!
    var style:KPresentStyle?
    var duration:TimeInterval?
    var startFrame:CGPoint?
    var isPush:Bool = false
    var interactionState:Bool = true
   
    override init() {}
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration ?? 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        context = transitionContext
        fromView = transitionContext.viewController(forKey: .from)!.view!
        toView = transitionContext.viewController(forKey: .to)!.view!
        
        guard let transitionStyle = style else { return }
        switch (transitionStyle) {
        case .alpha: setAlphaAnimate()
        case .scale: setScaleAnimate()
        case .right: setMoveAnimate(isVertical: false)
        case .top:   setMoveAnimate(isVertical: true)
        case .bounds: setBoundsAnimate()
        }
    }
    
    private func setAlphaAnimate() {
        if isPresent {
            context.containerView.addSubview(toView)
            toView.alpha = 0
            UIView.animate(withDuration: transitionDuration(using: context), animations: {
                self.toView.alpha = 1
            }) { (_) in
                self.context.completeTransition(true)
            }
        } else {
            if isPush { context.containerView.insertSubview(toView, belowSubview: fromView) }
            UIView.animate(withDuration: transitionDuration(using: context), animations: {
                self.fromView.alpha = 0
            }) { (_) in
                if self.interactionState {
                    self.fromView.removeFromSuperview()
                    self.context.completeTransition(true)
                } else {
                    self.context.completeTransition(false)
                }
            }
        }
    }
    
    private func setScaleAnimate() {
        if isPresent {
            context.containerView.addSubview(toView)
            toView.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.2)
            toView.alpha = 0
            UIView.animate(withDuration: transitionDuration(using: context), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
                self.toView.transform = CGAffineTransform.identity
                self.toView.alpha = 1
            }) { (success) in
                self.context.completeTransition(true)
            }
        } else {
            if isPush { context.containerView.insertSubview(toView, belowSubview: fromView) }
            UIView.animate(withDuration: transitionDuration(using: context), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.fromView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
                self.fromView.alpha = 0
            }) { (success) in
                if self.interactionState {
                    self.fromView.removeFromSuperview()
                    self.context.completeTransition(true)
                } else {
                    self.context.completeTransition(false)
                }
            }
        }
    }
    
    private func setMoveAnimate(isVertical:Bool) {
        var tmpOrigin:CGFloat = 0.0
        
        if isPresent {
            context.containerView.addSubview(toView)
            if !isVertical {
                tmpOrigin = toView.frame.origin.x
                toView.frame.origin.x += toView.frame.width
            } else {
                tmpOrigin = toView.frame.origin.y
                toView.frame.origin.y -= toView.frame.height
            }
            UIView.animate(withDuration: transitionDuration(using: context), animations: {
                if !isVertical {
                    self.toView.frame.origin.x = tmpOrigin
                } else {
                    self.toView.frame.origin.y = tmpOrigin
                }
            }) { (success) in
                self.context.completeTransition(true)
            }
        } else {
            if isPush { context.containerView.insertSubview(toView, belowSubview: fromView) }
            UIView.animate(withDuration: transitionDuration(using: context), animations: {
                if !isVertical {
                    self.fromView.frame.origin.x += self.fromView.frame.width
                } else {
                    self.fromView.frame.origin.y -= self.fromView.frame.height
                }
            }) { (success) in
                if self.interactionState {
                    self.fromView.removeFromSuperview()
                    self.context.completeTransition(true)
                } else {
                    self.context.completeTransition(false)
                }
            }
        }
    }
    
    private func setBoundsAnimate() {
        let startFrame = self.startFrame ?? CGPoint.zero
        let toViewOriginalCenter = toView.center
        
        if isPresent {
            context.containerView.addSubview(toView)
     
            toView.frame.size = CGSize(width: 128, height: 128)
            toView.layer.cornerRadius = toView.frame.height / 2
            toView.center = startFrame
            
            UIView.animate(withDuration: transitionDuration(using: context), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseIn], animations: {
                self.toView.bounds = UIScreen.main.bounds
                self.toView.center = toViewOriginalCenter
                self.toView.layer.cornerRadius = 0
            }) { (success) in
                self.context.completeTransition(true)
            }
        } else {
            if isPush { context.containerView.insertSubview(toView, belowSubview: fromView) }
            UIView.animate(withDuration: transitionDuration(using: context), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseIn], animations: {
                self.fromView.center = startFrame
                self.fromView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
                self.fromView.layer.cornerRadius = UIScreen.main.bounds.height * 0.5
            }) { (success) in
                if self.interactionState {
                    self.fromView.removeFromSuperview()
                    self.context.completeTransition(true)
                } else {
                    self.context.completeTransition(false)
                }
            }
        }
    }
}
