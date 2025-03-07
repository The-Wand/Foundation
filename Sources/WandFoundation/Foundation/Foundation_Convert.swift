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
import Foundation.NSBundle
import Wand

/// Convert
///
/// let range: NSRange = (0, 1)|
///
@inline(__always)
postfix
public
func |(p: (loc: Int, len: Int)) -> NSRange {
    NSMakeRange(p.loc, p.len)
}

/// Convert
///
/// let indexSet: IndexSet = 0|
///
@inline(__always)
postfix
public
func |(i: Int) -> IndexSet {
    IndexSet(integer: i)
}

/// Convert
///
/// let indexSet: IndexSet = [0, 1, 2]|
///
@inline(__always)
postfix
public
func |<S>(p: S) -> IndexSet where S: Sequence, S.Element == Int {
    IndexSet(p)
}

#endif
