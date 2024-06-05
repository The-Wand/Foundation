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

#if canImport(StoreKit)
import StoreKit.SKProduct
import Wand

/// Ask
///
/// ids | { (productsResponse: SKProductsResponse) in
///
/// }
///
@available(tvOS, unavailable)
extension SKProductsResponse: Asking, Wanded {

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        _ = wand.answer(the: ask)

        //Request for a first time

        //Prepare context
        let source: SKProductsRequest = wand.obtain()

        //Make request
        source.start()

    }
    

}


//@discardableResult
//
//public
//func | (ids: Set<String>, handler: @escaping (SKProductsResponse)->() ) -> Wand {
//
//    let wand = Wand()
//    wand.save(ids)
//
//    //Save ask
//    _ = wand.answer(the: .one(handler: handler))
//
//    //Request for a first time
//
//    //Prepare context
//    let source: SKProductsRequest = wand.obtain()
//
//    //Make request
//    source.start()
//
//    return wand
//}

#endif
