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

//#if canImport(Foundation)
//import Foundation.NSTextCheckingResult
//import XCTest
//
//import Any_
//import Wand
//import WandFoundation
//
//final
//class IndexPath_Tests: XCTestCase {
//
//    @MainActor
//    func test_IntInt_to_IndexPath() {
//        typealias T = IndexPath.Element
//
//        let raw = (T.any, T.any)
//        let path: IndexPath = raw|
//
//        XCTAssertEqual(path,
//                       IndexPath(row: raw.0, section: raw.1))
//    }
//
//    @MainActor
//    func test_IndexPath_to_IntInt() {
//        let path = IndexPath(row: .any, section: .any)
//        let tuple: (Int, Int) = path|
//
//        XCTAssertEqual(tuple.0, path.row)
//        XCTAssertEqual(tuple.1, path.section)
//    }
//
//}
//
//#endif
