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

#if canImport(Foundation)
import Foundation.NSRelativeDateTimeFormatter
import XCTest

import WandFoundation

final
class RelativeDateTimeFormatterDateTimeStyle_Tests: XCTestCase {

    func test_RelativeDateTimeFormatter() {

        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale.init(identifier: "en_US")

        XCTAssertEqual(formatter | 0, "in 0 seconds")

        var next = 1
        formatTest(60, qual: &next, start: "second") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        formatTest(60, qual: &next, start: "minute") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        formatTest(24, qual: &next, start: "hour") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        formatTest(7, qual: &next, start: "day") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        formatTest(4, qual: &next, start: "week") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        next = 60 * 60 * 24 * 31
        formatTest(12, qual: &next, start: "month") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }

        next = 60 * 60 * 24 * 366
        formatTest(12, qual: &next, start: "year") {
            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
        }
//
//
//            var next = 1
//            formatTest(60, qual: &next, start: "second") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
//
//            formatTest(60, qual: &next, start: "minute") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
//
//            formatTest(24, qual: &next, start: "hour") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
//
//            formatTest(7, qual: &next, start: "day") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
//
//            formatTest(4, qual: &next, start: "week") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
//
//            //        next = 31536000
//            //        formatTest(12, qual: &next, start: "month") {
//            //            XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            //        }
//
//            next = 31536000
//            formatTest(12, qual: &next, start: "year") {
//                XCTAssertEqual(formatter | $0, String(format: $2, $1) + $3)
//            }
    }

    func formatTest(_ bound: Int, qual: inout Int, start: String, handler: (Int, Int, String, String)->() ) {

        fraction(bound, qual: qual, start: "%i " + start, end: " ago", handler: handler)
        qual = bound * qual
    }

    func fraction(_ bound: Int, qual: Int, start: String, end: String, handler: (Int, Int, String, String)->()) {

        handler(qual, 1, start, end)

        (1...(1...5).any).forEach { _ in
            let middle = (2..<bound).any
            handler(middle * qual, middle, start + "s", end)
        }

        let upper = bound - 1
        handler(upper * qual, upper, start + "s", end)
    }

    func batch(_ bound: Int, qual: Int, handler: (Int, Int)->()) {

        (1...(1...5).any).forEach { _ in
            let middle = (2..<bound).any
            handler(middle * qual, middle)
        }

        let end = bound - 1
        handler(end * qual, end)
    }

    func bound(_ bound: Int, result: Int, handler: (Int, Int)->()) {
        handler(bound, result)
    }

    func random(_ bound: Int, handler: (Int)->()) {
        handler((2..<bound).any)
    }

}

#endif


public
extension Range where Bound: FixedWidthInteger {

    var any: Bound {
        .random(in: self)
    }

}
