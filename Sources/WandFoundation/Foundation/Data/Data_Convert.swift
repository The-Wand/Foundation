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
import Foundation.NSData
@_exported
import Wand

/// Convert
///
/// let data: Data = string|
///
@inline(__always)
postfix
public 
func |(string: String) -> Data {
    string.data(using: .utf8)!
}

/// Convert
///
/// let data: Data = string | .utf8
///
@inline(__always)
public
func |(string: String, encoding: String.Encoding) -> Data {
    string.data(using: encoding)!
}

/// Convert
///
/// let data: Data = (name: "icon", type: "png")|
///
@inline(__always)
postfix
public
func |(resource: Core.Resource) throws -> Data {
    try Data(contentsOf: resource|)
}

//Data
@inline(__always)
public
postfix func |(data: Data) -> String {
    String(data: data, encoding: .utf8)!
}

@inline(__always)
public
postfix func |(data: Data) -> String? {
    String(data: data, encoding: .utf8)
}

@inline(__always)
public
postfix func |(data: Data?) -> String {
    guard let data else {
        fatalError()
    }
    return String(data: data, encoding: .utf8)!
}

@inline(__always)
public
postfix func |(data: Data?) -> String? {
    guard let data else {
        return nil
    }
    return String(data: data, encoding: .utf8)
}

#endif
