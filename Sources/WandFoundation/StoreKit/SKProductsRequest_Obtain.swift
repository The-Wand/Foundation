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
import StoreKit.SKProductsRequest
@_exported
import Wand

/// Obtain
///
/// let session: URLSession = config|
///
//@available(tvOS, unavailable)
//@available(visionOS, unavailable)
//extension SKProductsRequest: Obtain {
//
//    @inline(__always)
//    public 
//    static
//    func obtain(by wand: Wand?) -> Self {
//
//        let ids: Set<String> = wand?.get() ?? []
//
//        let wand = wand ?? Wand()
//
//        let source = Self(productIdentifiers: ids)
//        source.delegate = wand.add(Delegate())
//
//        return source
//    }
//
//}
//
//@available(tvOS, unavailable)
//@available(visionOS, unavailable)
//extension SKProductsRequest {
//
//    class Delegate: NSObject, SKProductsRequestDelegate, Wanded {
//
//        func productsRequest(_ request: SKProductsRequest, 
//                             didReceive response: SKProductsResponse) {
//            isWanded?.add(response)
//        }
//
//        func request(_ request: SKRequest, didFailWithError error: any Error) {
//            isWanded?.add(error)
//        }
//
//    }
//
//}

#endif
