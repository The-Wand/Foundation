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

#if canImport(StoreKit)
import StoreKit.SKProduct
import Wand

/// Ask
///
/// ids | { (transactions: [SKPaymentTransaction]) in
///
/// }
///
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@discardableResult
@inline(__always)
public
func | (product: SKProduct, handler: @escaping ([SKPaymentTransaction])->() ) -> Core {

    let wand = product.wand
    let ask = Ask.one(handler: handler)

    let queue: SKPaymentQueue = wand.get()

    defer { //Add payment anyway
        let payment = SKPayment(product: product)
        queue.add(payment)
    }

    //Save ask
    guard wand.append(ask: ask) else {
        return wand
    }

    //Prepare first request
//    let delegate = wand.save(SKPaymentQueue.Delegate())
//    queue.add(delegate)
//
//    //Set the cleaner
//    wand.setCleaner(for: ask) {
//        queue.remove(delegate)
//    }

    return wand
}

#endif
