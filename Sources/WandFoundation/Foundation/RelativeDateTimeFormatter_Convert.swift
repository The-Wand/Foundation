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
import Foundation.NSRelativeDateTimeFormatter
import Wand

@inline(__always)
public
func | (timestamp: Int, dateTimeStyle: RelativeDateTimeFormatter.DateTimeStyle) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.dateTimeStyle = dateTimeStyle
    return formatter.localizedString(for: Date(timeIntervalSinceNow: -Double(timestamp)),
                                     relativeTo: Date())
}

@inline(__always)
public
func | (timestamp: Int, units: RelativeDateTimeFormatter.UnitsStyle) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = units
    return formatter.localizedString(for: Date(timeIntervalSinceNow: -Double(timestamp)),
                                     relativeTo: Date())
}

@inline(__always)
public
func | (timestamp: Int, relativeTo: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    return formatter.localizedString(for: Date(timeIntervalSinceNow: -Double(timestamp)),
                                     relativeTo: relativeTo)
}

@inline(__always)
public
func | (date: Date, relativeTo: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    return formatter.localizedString(for: date,
                                     relativeTo: relativeTo)
}

@inline(__always)
public
func | (formatter: RelativeDateTimeFormatter, timestamp: Int) -> String {
    formatter.localizedString(for: Date(timeIntervalSinceNow: -Double(timestamp)),
                              relativeTo: Date())
}


#endif
