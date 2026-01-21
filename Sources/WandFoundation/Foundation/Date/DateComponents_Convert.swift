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
/// Created by Aleks Kozin

#if canImport(Foundation)
@_exported
import Foundation.NSDate
@_exported
import Wand

/// Convert
///
/// let date: Date? = components|
///
@inline(__always)
postfix
public
func | (components: DateComponents) -> Date? {
    Calendar.current.date(from: components)
}

/// Convert
///
/// let component: Calendar.Component = date|
///
@inline(__always)
public
func |(date: Date, component: Calendar.Component) -> Int {
    Calendar.current.component(component, from: date)
}

#endif
