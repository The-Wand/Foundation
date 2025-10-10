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
import Foundation.NSUserDefaults
@_exported
import Wand

/// Ubiquitous
///
/// let defaults = UserDefaults.self|
///
extension UserDefaults: Ubiquitous {
    
    @inline(__always)
    static
    public
    func access() -> Self {
        Self.standard as! Self
    }
    
    @inline(__always)
    @discardableResult
    prefix
    public
    static
    func | (the: UserDefaults) -> Self {
        the as! Self
    }

}

#endif
