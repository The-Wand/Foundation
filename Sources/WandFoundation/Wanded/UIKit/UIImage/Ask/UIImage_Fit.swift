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

#if canImport(UIKit)
import UIKit.UIImage
import Wand

public
extension Ask {

    class Fit: Operation {
    }

}

@available(iOS 10.0, *)
@available(watchOS, unavailable)
public
extension Ask where T == UIImage {

    @discardableResult
    @inline(__always)
    static
    func fit (to size: CGSize, done: @escaping (UIImage)->() ) -> Self {
        .one().fit(to: size, done: done)
    }

    @discardableResult
    @inline(__always)
    func fit (to size: CGSize, done: @escaping (UIImage)->() ) -> Self {

        let once = self.once
        handler = { image in

            let imageSize = image.size

            let aspectWidth = size.width / imageSize.width
            let aspectHeight = size.height / imageSize.height

            let aspectRatio = min(aspectWidth, //TODO: remo c-p .fill
                                  aspectHeight)

            let canvas = CGSize(width: imageSize.width * aspectRatio,
                                height: imageSize.height * aspectRatio)

            let out = UIGraphicsImageRenderer(size: canvas).image { _ in
                image.draw(in: CGRect(origin: .zero,
                                      size: canvas))
            }

            done(out)
            return once
        }

        return self

    }

}

#endif
