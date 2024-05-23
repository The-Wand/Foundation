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

import Foundation
import Wand

/**Pipable

 postfix |(data: Data) -> some RestModel
 postfix |(raw: Dictionary) -> some RestModel

 infix | (url: URL, reply: (some RestModel)->() ) -> Pipe

 */

extension Data {

    postfix
    public
    static
    func |<T: Decodable>(data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }

    postfix
    public
    static
    func |(raw: Self) throws -> [String: Any]? {
        try? JSONSerialization.jsonObject(with: raw, options: []) as? [String : Any]
    }

    postfix
    public
    static
    func |(raw: Self) throws -> [Any]? {
        try? JSONSerialization.jsonObject(with: raw, options: []) as? [Any]
    }

}

extension Dictionary {

    static public postfix func |(p: Self) -> Data {
        try! JSONSerialization.data(withJSONObject: p, options: [])
    }

}

public postfix func |<T: Rest.Model>(raw: [String: Any]?) throws -> T {
    try (raw!)|
}

public postfix func |<T: Model>(raw: [String: Any]) throws -> T {
    try JSONDecoder().decode(T.self, from: raw|)
}

extension Array {

    static public postfix func |(p: Self) -> Data {
        try! JSONSerialization.data(withJSONObject: p, options: [])
    }

    static public postfix func |<T: Model>(raw: Self) throws -> [T] {
        try JSONDecoder().decode([T].self, from: raw|)
    }

}

public
postfix func |(resource: Wand.Resource) throws -> Data {
    try Data(contentsOf: resource|)
}

public
postfix func |<T: Decodable> (resource: Wand.Resource) throws -> T {
    let data: Data = try Data(contentsOf: resource|)
    return try data|
}

public
postfix func |(resource: Wand.Resource) throws -> [String: Any]? {
    let data: Data = try Data(contentsOf: resource|)
    return try data|
}
