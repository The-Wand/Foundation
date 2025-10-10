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

@_exported
import Foundation
@_exported
import Wand

@inline(__always)
postfix
public
func |<T: Model>(raw: [String: Any]?) throws -> T {
    try (raw!)|
}

@inline(__always)
postfix
public
func |<T: Model>(raw: [String: Any]) throws -> T {
    try JSONDecoder().decode(T.self, from: raw|)
}

extension Array {

    @inline(__always)
    postfix
    public
    static
    func |<T: Model>(raw: Self) throws -> [T] {
        try JSONDecoder().decode([T].self, from: raw|)
    }

}
