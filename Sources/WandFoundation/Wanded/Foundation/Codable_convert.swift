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

#if canImport(Foundation)
import Foundation
import Wand

/// Codable - Data

///
/// let t: Codable = data|
///
@inline(__always)
postfix
public
func |<T: Decodable>(data: Data) throws -> T {
    try JSONDecoder().decode(T.self, from: data)
}

///
/// let data: Data = codable|
///
@inline(__always)
postfix
public
func |<T: Codable>(model: T) -> Data {
    try! JSONEncoder().encode(model)
}

/// Codable - Array
extension Array {

    ///
    /// let data: Data = array|
    ///
    @inline(__always)
    postfix
    public
    static
    func |(p: Self) -> Data {
        try! JSONSerialization.data(withJSONObject: p, options: [])
    }

}

///
/// let array: [Any]? = data|
///
@inline(__always)
postfix
public
func |(raw: Data) throws -> [Any]? {
    try? JSONSerialization.jsonObject(with: raw, options: []) as? [Any]
}

/// Codable - Dictionary
extension Dictionary {

    @inline(__always)
    postfix
    public
    static
    func |(p: Self) -> Data {
        try! JSONSerialization.data(withJSONObject: p, options: [])
    }

}

@inline(__always)
postfix
public
func |(raw: Data) throws -> [String: Any]? {
    try? JSONSerialization.jsonObject(with: raw, options: []) as? [String : Any]
}

/// Codable - Bundle.Resource

/// Convert
///
/// let entity: Entity = (name: "entity", type: "json")|
///
@inline(__always)
postfix
public
func |<T: Decodable> (resource: Wand.Resource) throws -> T {
    let data: Data = try Data(contentsOf: resource|)
    return try data|
}

/// Convert
///
/// let dictionary: [String: Any]? = (name: "entity", type: "json")|
///
@inline(__always)
postfix
public
func |(resource: Wand.Resource) throws -> [String: Any]? {
    let data: Data = try Data(contentsOf: resource|)
    return try data|
}

#endif
