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

#if canImport(Foundation)
import Foundation.NSTextCheckingResult
import XCTest

import Wand
import WandFoundation

final
class NSTextCheckingResultCheckingType_Tests: XCTestCase {

//    @available(macOS 15.0, iOS 15, tvOS 15, watchOS 8, *)
//    func test_NSTextCheckingResult_date() {
//        
//        let hour: Int = .any(in: 0...23)
//        let minute: Int = .any(in: 0...59)
//        let second: Int = .any(in: 0...59)
//
//
//        //Check equality
//        let calendar = Calendar.current
//        var components = calendar.dateComponents([.day, .month, .year],
//                                                 from: .now)
//        components.day = components.day! + 1
//
//        components.hour = hour
//        components.minute = minute
//        components.second = second
//
//        let raw = "tomorrow at \(hour):\(minute):\(second)"
//        
//        XCTAssertEqual(raw | .date,
//                       calendar.date(from: components))
//    }

    func test_NSTextCheckingResult_address() {

        let raw = "1 Infinite Loop in Cupertino, California, United States"
        
        XCTAssertEqual(raw | .address,
                       [NSTextCheckingKey.state: "California",
                        NSTextCheckingKey.city: "Cupertino",
                        NSTextCheckingKey.street: "1 Infinite Loop",
                        NSTextCheckingKey.country: "United States"])
    }

    func test_NSTextCheckingResult_url() {

        let raw = "1 Infinite Loop in Cupht//www.apple.com California, United States"

        XCTAssertEqual(raw | .link,
                       URL(string: "http://www.apple.com"))

    }

    func test_NSTextCheckingResult_phoneNumber() {
        let found: String? = "1 Inffornia +19323232444,United States" | .phoneNumber

        //Check equality
        let calculated = "+19323232444"
        XCTAssertEqual(found, calculated)
    }

}

#endif
