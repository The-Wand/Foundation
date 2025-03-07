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
import UIKit.UIImage
import Wand

public
extension Ask {

    class Round: Operation {
    }

}

@available(iOS 10.0, *)
@available(watchOS, unavailable)
public
extension Ask where T == UIImage {

    @available(iOS 13.0, *)
    @discardableResult
    @inline(__always)
    static
    func round(to radius: CGFloat, done: @escaping (UIImage)->() ) -> Self {
        .one().round(to: radius, done: done)
    }

    @available(iOS 13.0, *)
    @discardableResult
    @inline(__always)
    func round(to radius: CGFloat, done: @escaping (UIImage)->() ) -> Self {

        let once = self.once
        handler = { image in

            let size = image.size
            let rounded = UIGraphicsImageRenderer(size: size).image { c in
                let rect = CGRect(origin: .zero, size: size)
                UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()
                image.draw(in: rect)
            }

            done(rounded)
            return !once
        }

        return self

    }

}

#endif
