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

#if canImport(UIKit)
import UIKit.UIColor
import Wand

@inline(__always)
postfix
public
func |<T: BinaryInteger>(color: T) -> UIColor {
    color | 1
}

@inline(__always)
public
func |<T: BinaryInteger>(color: T, alpha: CGFloat) -> UIColor {
    UIColor(red:    CGFloat((color & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((color & 0x00FF00) >> 8 ) / 255.0,
            blue:   CGFloat((color & 0x0000FF)      ) / 255.0,
            alpha:  alpha)
}

#endif
