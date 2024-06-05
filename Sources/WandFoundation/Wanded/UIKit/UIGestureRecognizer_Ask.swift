///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

import UIKit.UIGestureRecognizer
import Wand

extension UIView: Wanded {

}

extension UIGestureRecognizer: Wanded {

}


@discardableResult
public
func |<T: UIGestureRecognizer> (view: UIView, handler: @escaping (T)->()) -> T {
    view | .every(handler: handler)
}

@discardableResult
public
func |<T: UIGestureRecognizer> (view: UIView, ask: Ask<T>) -> T {

    typealias Delegate = UIGestureRecognizer.Delegate

    let wand = view.wand

    let recognizer = T()

    ask.key = recognizer|
    _ = wand.answer(the: ask)

    let delegate = wand.add(Delegate())
    recognizer.addTarget(delegate,
                         action: #selector(Delegate.handle(sender:)))

    view.addGestureRecognizer(recognizer)

    return wand.add(recognizer)
}

extension UIGestureRecognizer {

    class Delegate: NSObject, Wanded {

        @objc
        func handle(sender: UIGestureRecognizer) {
            isWanded?.add(sender, for: sender|)
        }

    }

}
