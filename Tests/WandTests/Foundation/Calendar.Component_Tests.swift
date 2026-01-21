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
/// Created by Alek Kozin

#if canImport(Foundation)
import Testing
import WandFoundation

struct Calendar_Tests {

}

extension Calendar.Component: @retroactive CaseIterable {

    public
    static
    let allCases: [Calendar.Component] = [
        .era,
        .year,
        .month,
        .day,
        .hour,
        .minute,
        .second,
        .weekday,
        .weekdayOrdinal,
        .quarter,
        .weekOfMonth,
        .weekOfYear,
        .yearForWeekOfYear,
        .nanosecond,
        .calendar,
        .timeZone
    ]

}

extension Calendar_Tests {

    struct Component_Tests {

        @Test
        func test_Date_to_Int() {

            let date = Date.any
            let calendar = Calendar.current
            Calendar.Component.allCases.forEach {
                #expect(date | $0 == calendar.component($0, from: date))
            }
        }

//        @Test
//        func test_Components_to_Date() {
//
//            let components = DateComponents.any
//
//            #expect(components| == Calendar.current.date(from: components)!)
//        }

    }

}

#endif
