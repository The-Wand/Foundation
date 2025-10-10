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
import StoreKit
@_exported
import Wand

/// Obtain
///
/// let q: SKPaymentQueue = nil|
///
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension SKPaymentQueue: Obtainable {
    
    @inline(__always)
    public
    static
    func obtain(by wand: Core?) -> Self {
        Self.default()
    }
    
}

@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension SKPaymentQueue {

    class Delegate: NSObject, SKPaymentTransactionObserver, Wanded {
        
        @inlinable
        func paymentQueue(_ queue: SKPaymentQueue,
                          updatedTransactions transactions: [SKPaymentTransaction]) {
            isWanded?.add(transactions)
        }
        
        @inlinable
        func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: any Error) {
            isWanded?.add(error)
        }

    }
    
}

#endif
