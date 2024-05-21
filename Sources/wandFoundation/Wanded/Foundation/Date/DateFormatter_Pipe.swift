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
/// Created by Alex Kozin
/// 2020 El Machine

import Foundation
import wand

public func | (date: Date?, style: (date: DateFormatter.Style,
                                    time: DateFormatter.Style)) -> String? {

    guard let date else {
        return nil
    }

    let formatter: DateFormatter = style|
    return formatter.string(from: date)
}

//Format
public func | (date: Date?, format: String) -> String? {
    guard let date else {
        return nil
    }

    let formatter: DateFormatter = format|
    return formatter.string(from: date)
}

//DateFormatter
extension DateFormatter: Obtain {

    public 
    static func obtain(by wand: Wand?) -> Self {
        let formatter = Self()

        //TODO: both is required?
        if let style: (date: DateFormatter.Style,
                       time: DateFormatter.Style) = wand?.get() {

            formatter.dateStyle = style.0
            formatter.timeStyle = style.1

            return formatter
        }

        if let format: String = wand?.get() {
            formatter.dateFormat = format

            return formatter
        }

        return formatter

    }

}

//Shortcuts
public postfix func | (style: (date: DateFormatter.Style,
                               time: DateFormatter.Style)) -> DateFormatter {

    let formatter = DateFormatter()
    formatter.dateStyle = style.0
    formatter.timeStyle = style.1

    return formatter
}

public postfix func | (format: String) -> DateFormatter {

    let formatter = DateFormatter()
    formatter.dateFormat = format

    return formatter
}

public func | (formatter: DateFormatter, date: Date?) -> String? {

    guard let date else {
        return nil
    }

    return formatter.string(from: date)
}
