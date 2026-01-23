///
/// Copyright 2020 Aleksander Kozin
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
/// Created by Aleksander Kozin
/// The Wand

import Any_
import Foundation
import Testing
import WandFoundation

struct Date_Convertable_Tests {

    @Test
    func date_to_string_format()
    {
        let date = Date(timeIntervalSince1970: 1_111_111_111)
        let format = "yyyy-MM-dd HH:mm:ss"

        let formatter = DateFormatter()
        formatter.dateFormat = format

        #expect( date | format
                 ==
                 formatter.string(from: date)
        )
    }

    @Test
    func date_to_string_format_locale()
    {
        let date = Date(timeIntervalSince1970: .any)

        let format = "yyyy-MM-dd HH:mm:ss"
        let locale = Locale(identifier: "zh_Hans_CN")

        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale

        #expect( date | (format, locale)
                 ==
                 formatter.string(from: date)
        )
    }

    @Test
    func date_to_string_format_locale_timezone()
    {
        let date = Date(timeIntervalSince1970: .any)

        let format = "yyyy-MM-dd HH:mm:ss"
        let locale = Locale(identifier: "en_US")
        let timezone = TimeZone(abbreviation: "EST")!

        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        formatter.timeZone = timezone

        #expect( date | (format, locale, timezone)
                 ==
                 formatter.string(from: date)
        )
    }

    @Test
    func date_to_string_format_timezone()
    {
        let date = Date(timeIntervalSince1970: .any)

        let format = "yyyy-MM-dd HH:mm:ss"
        let timezone = TimeZone(abbreviation: "EST")!

        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timezone

        #expect( date | (format, timezone)
                 ==
                 formatter.string(from: date)
        )
    }

}
