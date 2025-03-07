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
import UIKit.UIView
import Wand

///UIView
@inline(__always)
postfix
public
func |(view: UIView) -> CGSize {
    view.frame.size
}

@inline(__always)
public
func | (view: UIView, contentMode: UIView.ContentMode) -> UIView {
    view.contentMode = contentMode
    return view
}

@inline(__always)
postfix
public
func |(rect: CGRect) -> UIView {
    UIView(frame: rect)
}

//Animations
@inline(__always)
public
func |(interval: TimeInterval, animations: @escaping ()->()) {
    UIView.animate(withDuration: interval, animations: animations)
}

@inline(__always)
public
func |(wanded: (duration: TimeInterval, delay: TimeInterval),
       animations: @escaping ()->()) {

    UIView.animate(withDuration: wanded.duration,
                   delay: wanded.delay,
                   options: [],
                   animations: animations)
}

@inline(__always)
public
func |(wanded: (duration: TimeInterval, options: UIView.AnimationOptions),
              animations: @escaping ()->() ) {
    UIView.animate(withDuration: wanded.duration,
                   delay: 0,
                   options: wanded.options,
                   animations: animations)
}

@inline(__always)
public
func |(wanded: (duration: TimeInterval,
               options: UIView.AnimationOptions),
       blocks: (animations: ()->(),
                completion: (Bool)->())
) {
    UIView.animate(withDuration: wanded.duration,
                   delay: 0,
                   options: wanded.options,
                   animations: blocks.animations,
                   completion: blocks.completion)
}

#endif
