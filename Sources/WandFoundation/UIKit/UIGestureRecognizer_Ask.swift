///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

#if canImport(UIKit) && !os(watchOS)
import UIKit.UIGestureRecognizer
import Wand

extension UIView: Wanded {

}

extension UIGestureRecognizer: Wanded {

}

/// Ask
///
/// view | { (tap: UI<#Tap#>GestureRecognizer) in
///
/// }
///
@discardableResult
@inline(__always)
public
func |<T: UIGestureRecognizer> (view: UIView, handler: @escaping (T)->()) -> UIView {
    view | .every(handler: handler)
}

/// Ask
///
/// view | .while { (tap: UI<#Tap#>GestureRecognizer) in
///    true
/// }
///
@discardableResult
@inline(__always)
public
func |<T: UIGestureRecognizer> (view: UIView, ask: Ask<T>) -> UIView {

    typealias Delegate = UIGestureRecognizer.Delegate

    let wand = view.wand

    let recognizer = T()

    ask.key = recognizer|
    _ = wand.append(ask: ask)

    let delegate = wand.add(Delegate())
    recognizer.addTarget(delegate,
                         action: #selector(Delegate.handle(sender:)))

    view.addGestureRecognizer(recognizer)
    
    wand.setCleaner(for: ask) { [weak view, weak recognizer] in
        guard let recognizer else {
            return
        }
        
        view?.removeGestureRecognizer(recognizer)
    }

    wand.add(recognizer)
    
    return view
}

extension UIGestureRecognizer {

    class Delegate: NSObject, Wanded {

        @objc
        @inline(__always)
        public
        func handle(sender: UIGestureRecognizer) {
            isWanded?.add(sender, for: sender|)
        }

    }

}

#endif
