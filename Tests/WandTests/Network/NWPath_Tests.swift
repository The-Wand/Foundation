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

#if canImport(Network)
import Network
import XCTest

import Wand
import WandFoundation

final
class NWPath_Tests: XCTestCase {

    @MainActor
    func test_NWPath() {
        
        auto_test { (path: NWPath) in
            print("✅ \(path)")
        }
        
    }

#if targetEnvironment(simulator)
//    func test_Notification_memory() {
//        let e = expectation()
//
//        //Simulate Memory Warning
//        //⌘+⇧+M
//        UIApplication.didReceiveMemoryWarningNotification | .one { n in
//            e.fulfill()
//        }
//
//        waitForExpectations()
//    }
//
//    func test_WhileNotification() {
//        let e = expectation()
//        e.expectedFulfillmentCount = 2
//
//        //Simulate Memory Warning
//        //⌘+⇧+M
//        UIApplication.didReceiveMemoryWarningNotification | .while { (notification, i) in
//            e.fulfill()
//
//            print(notification)
//
//            return i < 2
//        }
//
//        waitForExpectations()
//    }
#endif

}

#endif
