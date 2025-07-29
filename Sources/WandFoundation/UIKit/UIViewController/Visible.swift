//
//  Visible.swift
//  Heap
//
//  Created by Alexander Kozin on 19.06.16.
//  Copyright © Tradernet All rights reserved.
//

#if canImport(UIKit) && !os(watchOS) && !os(visionOS)
import UIKit

public 
extension UIViewController {

    @inline(__always)
    @objc
    fileprivate
    var visible: UIViewController {
        presentedViewController?.visible ?? self
    }

    @inline(__always)
    var containerController: UIViewController? {
        tabBarController ?? navigationController ?? splitViewController
    }

    @inline(__always)
    var isRoot: Bool {
        UIApplication.shared.visibleWindow?.rootViewController == self
    }

    @inline(__always)
    var isVisible: Bool {
        UIApplication.shared.visibleViewController == self
    }
    
    @inline(__always)
    func presentOnVisible(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.visibleViewController?.present(self,
                                                            animated: animated,
                                                            completion: completion)
    }

}

public 
extension UINavigationController {

    @inline(__always)
    @objc
    override 
    var visible: UIViewController {
        visibleViewController?.visible ?? self
    }

}

public 
extension UITabBarController {

    @inline(__always)
    @objc
    override 
    var visible: UIViewController {
        selectedViewController?.visible ?? self
    }

}

public 
extension UIApplication {

    @inline(__always)
    var visibleViewController: UIViewController? {
        visibleWindow?.rootViewController?.visible
    }

    @inline(__always)
    var rootViewController: UIViewController? {
        visibleWindow?.rootViewController
    }

    @inline(__always)
    var visibleWindow: UIWindow? {
        if #available(iOS 13, tvOS 13, *) {

            let scene = UIApplication.shared.connectedScenes.first {
                ($0 as? UIWindowScene)?.activationState == .foregroundActive
            } as? UIWindowScene

            return scene?.windows.first(where: \.isKeyWindow)
        } else {
            return keyWindow
        }
    }

}
#endif
