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

#if canImport(CoreBluetooth)
import CoreBluetooth.CBPeripheral
import Wand

/// Ask
///
/// |.one { T in
///
/// }
///
@discardableResult
@inline(__always)
prefix
public
func | (ask: Ask<[CBPeripheral]>.Retrieve) -> Wand {
    nil | ask
}

//@discardableResult
//@inline(__always)
//prefix
//public
//func | (ask: Ask<[CBPeripheral]>.RetrieveConnected) -> Wand {
//    nil | ask
//}

/// Ask
///
/// wand | .retrieve { (peripherals: [CBPeripheral]) in
///
/// }
///
@inline(__always)
@discardableResult
public
func |(wand: Wand, ask: Ask<[CBPeripheral]>.Retrieve) -> Wand {

    //Save ask
//    ask.key = CBCentralManager.Delegate.Keys.ret
    guard wand.answer(the: ask) else {
        return wand
    }

    //Request for a first time

    //Prepare context
    let source: CBCentralManager    = wand.obtain()
    let ids: [UUID]                 = wand.get() ?? []

    //Make request
    let peripherals = source.retrievePeripherals(withIdentifiers: ids)

    return wand
}

//@discardableResult
//public
//func |<T> (context: T, ask: Ask<[CBPeripheral]>.RetrieveConnected) -> Pipe {
//
//    let pipe = Pipe.attach(to: context)
//
//    let source: CBCentralManager    = pipe.get()
//    let ids: [UUID]                 = pipe.get() ?? []
//
//    let peripherals = source.retrievePeripherals(withIdentifiers: ids)
//    _ = ask.handler(peripherals)
//
//    pipe.closeIfDone()
//
//    return pipe

//    //Save ask
//    guard wand.answer(the: ask, check: true) else {
//        return
//    }
//
//    //Request for a first time
//
//    //Prepare context
//    let source: CLLocationManager = wand.obtain()
//
//    //Set the cleaner
//    wand.setCleaner(for: ask) {
//        source.stopUpdatingLocation()
//    }
//
//    //Make request
//}


//@discardableResult
//public
//func |<T> (context: T, ask: Ask<[CBPeripheral]>.RetrieveConnected) -> Pipe {
//
//    let pipe = Pipe.attach(to: context)
//
//    let source: CBCentralManager = pipe.get()
//    let connected = source.retrieveConnectedPeripherals(withServices: pipe.get() ?? [])
//
//    _ = ask.handler(connected)
//
//    pipe.closeIfDone()
//
//    return pipe
//}

public
extension Ask {

    class Retrieve: Ask {
    }

    class RetrieveConnected: Ask {
    }

}

public
extension Ask where T == Array<CBPeripheral> {

    static func retrieve(handler: @escaping (T)->() ) -> Retrieve {
        .one(handler: handler)
    }


    static func retrieveConnected(handler: @escaping (T)->() ) -> RetrieveConnected {
        .one(handler: handler)
    }

}

#endif
