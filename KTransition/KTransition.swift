//
//  Created by Kenan Atmaca on 2.09.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

public enum KPresentStyle {
    case scale
    case alpha
    case right
    case top
    case bounds
}

open class KTransition {
    
    private static var presentCoordinator:KPresentTransitionCoordinator!
    private static var pushCoordinator:KPushTransitionCoordinator!
    
    static public func present(style: KPresentStyle, duration: TimeInterval, startFrame:CGPoint? = nil) -> KPresentTransitionCoordinator {
        presentCoordinator = KPresentTransitionCoordinator()
        presentCoordinator.animator?.style = style
        presentCoordinator.animator?.duration = duration
        presentCoordinator.animator?.startFrame = startFrame
        return presentCoordinator
    }
    
    static public func push(style: KPresentStyle, duration: TimeInterval) -> KPushTransitionCoordinator {
        pushCoordinator = KPushTransitionCoordinator()
        pushCoordinator.animator?.style = style
        pushCoordinator.animator?.duration = duration
        pushCoordinator.animator?.isPush = true
        return pushCoordinator
    }
}
