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

extension Image: AskingNil, Wanded {

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
    @inlinable
    public
    static
    func ask<C, T>(with context: C, ask: Ask<T>) -> Core {

        let wand = Wand.Core.to(context)
        
        //Save ask
        guard wand.append(ask: ask, check: true) else {
            return wand
        }

        #if os(iOS)
            //Request for a first time
            let source: UIImagePickerController = wand.get()
            source.presentOnVisible()
        #endif
        
        return wand
        
    }


}

#endif
