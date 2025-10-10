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
@_exported
import Foundation.NSTimeZone
@_exported
import Wand

///
/// Convert
///
/// let timeZone: TimeZone? = "usUs"|
///
@inline(__always)
postfix
public
func |(string: String) -> TimeZone? {
    TimeZone(identifier: string) ?? TimeZone(abbreviation: string)
}

///
/// Convert
///
/// let timeZone: TimeZone? = seconds|
///
@inline(__always)
postfix
public
func |(seconds: Int) -> TimeZone? {
    TimeZone(secondsFromGMT: seconds)
}

#endif
