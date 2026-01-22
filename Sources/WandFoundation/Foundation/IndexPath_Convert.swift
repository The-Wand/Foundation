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

//#if canImport(Foundation) && !os(macOS)
//@_exported
//import Foundation.NSIndexPath
//@_exported
//import Wand
//
///// Convert
/////
///// let path: IndexPath = (0, 1)|
/////
//@inline(__always)
//postfix
//public
//func | (raw: (Int, Int)) -> IndexPath {
//    .init(row: raw.0, section: raw.1)
//}
//
///// Convert
/////
///// let tuple = path|
/////
//@inline(__always)
//postfix
//public
//func | (path: IndexPath) -> (Int, Int) {
//    (path.row, path.section)
//}
//
//extension Array {
//
//    @inline(__always)
//    postfix
//    public
//    static
//    func |(p: Self) -> [IndexPath] {
//        (0..<p.count)|
//    }
//}
//
//extension Range where Bound == Int {
//
//    @inline(__always)
//    postfix
//    public
//    static
//    func |(p: Self) -> [IndexPath] {
//        p.map {
//            IndexPath(row: $0, section: 0)
//        }
//    }
//
//}
//
//extension ClosedRange where Bound == Int {
//
//    @inline(__always)
//    postfix
//    public
//    static
//    func |(p: Self) -> [IndexPath] {
//        p.map {
//            IndexPath(row: $0, section: 0)
//        }
//    }
//
//}
//
//#endif
