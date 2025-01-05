/////
///// Copyright © 2020-2024 El Machine 🤖
///// https://el-machine.com/
/////
///// Licensed under the Apache License, Version 2.0 (the "License");
///// you may not use this file except in compliance with the License.
///// You may obtain a copy of the License at
/////
///// 1) LICENSE file
///// 2) https://apache.org/licenses/LICENSE-2.0
/////
///// Unless required by applicable law or agreed to in writing, software
///// distributed under the License is distributed on an "AS IS" BASIS,
///// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///// See the License for the specific language governing permissions and
///// limitations under the License.
/////
///// Created by Alex Kozin
///// 2020 El Machine
//
//#if canImport(CoreBluetooth)
//import CoreBluetooth.CBPeripheral
//import Wand
//
///// Ask
/////
///// |.one { T in
/////
///// }
/////
//@discardableResult
//@inline(__always)
//prefix
//public
//func | (ask: Ask<[CBCharacteristic]>) -> Wand {
//    nil | ask
//}
//
////@discardableResult
////@inline(__always)
////prefix
////public
////func | (ask: Ask<[CBPeripheral]>.RetrieveConnected) -> Wand {
////    nil | ask
////}
//
///// Ask
/////
///// wand | .retrieve { (peripherals: [CBPeripheral]) in
/////
///// }
/////
//@inline(__always)
//@discardableResult
//public
//func |(wand: Wand, ask: Ask<[CBCharacteristic]>) -> Wand {
//
//    //Save ask
//    guard wand.answer(the: ask) else {
//        return wand
//    }
//
//    //Request for a first time
//
//    //Prepare context
//    let peripheral: CBPeripheral = wand.get()!
//
//    let delegate: CBPeripheralDelegate? = wand.get()
//    if (delegate == nil) {
//        peripheral.delegate = wand.add(CBPeripheral.Delegate())
//    }
//
//    //Make request
//    let service: CBService = wand.get()!
//    peripheral.discoverCharacteristics(wand.get(), for: service)
//
//    return wand
//}
//
//#endif
