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

extension Wand {

    public 
    typealias Resource = (name: String, type: String)

}

/// Convert
///
/// let url: URL = resource|
///
@inline(__always)
postfix
public
func | (resource: Wand.Resource) -> URL {
    Bundle.main.url(forResource: resource.name, withExtension: resource.type)!
}

/// Convert
///
/// let string: String = resource|
///
@inline(__always)
postfix
public
func | (resource: Wand.Resource) -> String {
    Bundle.main.path(forResource: resource.name, ofType: resource.type)!
}

#endif
