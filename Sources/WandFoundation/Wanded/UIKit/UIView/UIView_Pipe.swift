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

#if !os(watchOS) && canImport(UIKit)

import UIKit
import Wand

//UIView
public
postfix func |(view: UIView) -> CGSize {
    view.frame.size
}

public
func | (view: UIView, contentMode: UIView.ContentMode) -> UIView {
    view.contentMode = contentMode
    return view
}

public
postfix func |(rect: CGRect) -> UIView {
    UIView(frame: rect)
}

//Animations
public
func |(interval: TimeInterval, animations: @escaping ()->()) {
    UIView.animate(withDuration: interval, animations: animations)
}

public
func |(piped: (duration: TimeInterval, delay: TimeInterval),
       animations: @escaping ()->()) {

    UIView.animate(withDuration: piped.duration,
                   delay: piped.delay,
                   options: [],
                   animations: animations)
}

public
func |(piped: (duration: TimeInterval, options: UIView.AnimationOptions),
              animations: @escaping ()->() ) {
    UIView.animate(withDuration: piped.duration,
                   delay: 0,
                   options: piped.options,
                   animations: animations)
}

public func |(piped: (duration: TimeInterval,
                      options: UIView.AnimationOptions),
                blocks: (animations: ()->(),
                         completion: (Bool)->())
) {
    UIView.animate(withDuration: piped.duration,
                   delay: 0,
                   options: piped.options,
                   animations: blocks.animations,
                   completion: blocks.completion)
}

#endif
