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

    class Scale: Operation {
    }
    
}

@available(iOS 10.0, *)
@available(watchOS, unavailable)
public
extension Ask where T == UIImage {

    @discardableResult
    @inline(__always)
    static
    func scale (to size: CGSize, done: @escaping (UIImage)->() ) -> Self {
        .one().scale(to: size, done: done)
    }

    @discardableResult
    @inline(__always)
    func scale (to size: CGSize, done: @escaping (UIImage)->() ) -> Self {

        let once = self.once
        handler = { image in

            let scaled = UIGraphicsImageRenderer(size: size).image { c in
                image.draw(in: CGRect(origin: .zero, size: size))
            }

            done(scaled)
            return once
        }

        return self

    }

}

#endif
