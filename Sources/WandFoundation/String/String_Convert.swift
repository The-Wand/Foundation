///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) .LICENSE
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
@_exported
import Foundation
@_exported
import Wand

///| unwrap
@inline(__always)
postfix
public
func |<T: LosslessStringConvertible>(p: T?) -> String {
    guard let piped = p else {
        return ""
    }

    return String(piped)
}

@inline(__always)
prefix
public
func |(sub: Substring) -> String {
    String(sub)
}

@inline(__always)
prefix
public
func |(self: String?) -> String {
    self ?? ""
}

/// CharacterSet
@inline(__always)
public
func |(p: String?, filtering: CharacterSet) -> String? {
    guard let piped = p else {
        return nil
    }

    return (piped | filtering) as String
}

@inline(__always)
public
func |(p: String, filtering: CharacterSet) -> String {
    String(p.unicodeScalars.filter {
        filtering.contains($0)
    })
}

///Range
@inline(__always)
public 
func |(p: String, replace: (bounds: Range<String.Index>, to: String)) -> String {
    var piped = p
    piped.replaceSubrange(replace.0, with: replace.1)
    return piped
}

@inline(__always)
public
func |(p: String, replace: (ClosedRange<String.Index>, String)) -> String {
    var piped = p
    piped.replaceSubrange(replace.0, with: replace.1)
    return piped
}

@inline(__always)
public
func |(p: String, range: NSRange) -> String {
    let from = p.index(p.startIndex, offsetBy: range.lowerBound)
    let to = p.index(p.startIndex, offsetBy: range.upperBound)

    return p | (from..<to)
}

@inline(__always)
public
func |(piped: String, replace: (bounds: NSRange, to: String)) -> String {
    var string = piped

    let range: Range<String.Index> = string | replace.bounds
    string.replaceSubrange(range, with: replace.to)
    return string
}

///Components
@inline(__always)
public
func |(piped: String?, separator: any StringProtocol) -> [String]? {
    piped?.components(separatedBy: separator)
}

@inline(__always)
public
func |(piped: String, separator: any StringProtocol) -> [String] {
    piped.components(separatedBy: separator)
}

//public func |(format: String, arguments: CVarArg...) -> String {
//}

#endif
