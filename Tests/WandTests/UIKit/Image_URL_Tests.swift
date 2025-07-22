/////
///// Copyright 2020 Alexander Kozin
/////
///// Licensed under the Apache License, Version 2.0 (the "License");
///// you may not use this file except in compliance with the License.
///// You may obtain a copy of the License at
/////
/////     http://www.apache.org/licenses/LICENSE-2.0
/////
///// Unless required by applicable law or agreed to in writing, software
///// distributed under the License is distributed on an "AS IS" BASIS,
///// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///// See the License for the specific language governing permissions and
///// limitations under the License.
/////
///// Created by Alex Kozin
///// El Machine 🤖
//
//#if canImport(UIKit) && !os(watchOS)
//import Foundation
//import UIKit.UIImage
//
//import Any_
//import WandFoundation
//import Wand
//
//import XCTest
//
//final
//class Image_URL_Tests: XCTestCase {
//
//    @available(iOS 15.0, *)
//    @MainActor
//    func test_Path_to_Image() {
//        let e = expectation()
//
//        let url = URL(string: "https://developer.apple.com/support/images/home/hero-large_2x.png")
//        "url" | { (image: UIImage) in
//
//            //TODO: if rounded.isRounded() {
//            e.fulfill()
//
//        } | { (error: Error) in
//            
//            print(error)
//            
//        }
//
//        waitForExpectations()
//    }
//
//}
//
//#endif
