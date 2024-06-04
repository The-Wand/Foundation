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

public
typealias Image = UIImage

import Wand

extension Image: AskingNil, Wanded {

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        guard wand.answer(the: ask) else {
            return
        }

        #if os(iOS)
            //Request for a first time
            let source: UIImagePickerController = wand.obtain()
            source.presentOnVisible()
        #endif
    }


}

/// Ask
/// - .scale
/// - .fit
/// - .fill
///
/// - .round
///
/// image | .operation(to:) { done: Image in
///
/// }
///
//@inline(__always)
//@discardableResult
//public
//func | (image: Image?, ask: Ask<Image>) -> Wand {
//
//    let wand = Wand.to(image)
//    _ = wand.answer(the: ask, check: true)
//    return wand
//
//}

#endif
