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

//import Foundation
//

//extension Array: Asking {
//
//    public static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {
//
//        //Asking
//        if let asking = Element.self as? Asking.Type {
//            asking.wand(wand, asks: ask)
//
//            return
//        }
//
//        guard Element.self == Any.self else {
//            return
//        }
//
//        //Any
//        guard wand.answer(the: ask) else {
//            return
//        }
//
//        let headers = ["Accept": "application/json",
//                       "Content-Type": "application/json"]
//        wand.save(headers)
//
////        wand | .one { (data: Data) in
////            do {
////                let parsed = try JSONSerialization.jsonObject(with: data)
////                pipe.put(parsed as! Self)
////            } catch(let e) {
////                pipe.put(e)
////            }
////        }
//
//    }
//
//}
//
//extension Dictionary: Wanded where Key == String, Value == Any {
//
//}
//
//extension Dictionary: Asking where Key == String, Value == Any {
//
//    public static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {
//
//        guard wand.wand.answer(the: ask) else {
//            return
//        }
//
//        let headers = ["Accept": "application/json",
//                       "Content-Type": "application/json"]
//        wand.save(headers)
//
////        wand | .one { (data: Data) in
////            do {
////                let parsed = try JSONSerialization.jsonObject(with: data)
////                wand.add(parsed as! Self)
////            } catch(let e) {
////                wand.add(e)
////            }
////        }
//
//    }
//
//}

//extension Dictionary: JSONObject where Key == String, Value == Any {
//
//}
//
//
//public
//protocol JSONObject: Asking {
//
//
//}
//
//extension JSONObject {
//
//
//
//}
