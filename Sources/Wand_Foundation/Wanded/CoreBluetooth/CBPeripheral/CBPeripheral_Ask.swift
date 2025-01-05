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
import CoreBluetooth.CBManager
import Wand

/// Ask
///
/// |{ (state: CBManagerState) in
///
/// }
///
extension CBPeripheral: @retroactive Wanded {}
extension CBPeripheral: @retroactive Asking {}

extension CBPeripheral: @retroactive AskingNil {

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        guard wand.answer(the: ask, check: true) else {
            return
        }

        //Request for a first time

        //Prepare context
        let source: CBCentralManager = wand.obtain()

        //Set the cleaner
        wand.setCleaner(for: ask) {
            source.stopScan()
        }

        //Make request
        source | .while { (status: CBManagerState) -> Bool in
            guard status == .poweredOn else {
                return true
            }

            let services: [CBUUID]?         = wand.get()
            let options: [String : Any]?    = wand.get()

            source.scanForPeripherals(withServices: services,
                                      options: options)

            return !ask.once
        }

    }

}

public
extension Ask {

    class DidConnect: Every {
    }

    class DidDisconnect: Every {
    }

}

public
extension Ask where T == CBPeripheral {

    @inline(__always)
    static
    func didConnect(handler: @escaping (CBPeripheral)->() ) -> DidConnect {
        .init(once: false, for: CBCentralManager.Delegate.Keys.didConnect.rawValue) {
            handler($0)
            return true
        }
    }


    static
    func didDisconnect(handler: @escaping (CBPeripheral)->() ) -> DidDisconnect {
        .init(once: false, for: CBCentralManager.Delegate.Keys.didDisconnectPeripheral.rawValue) {
            handler($0)
            return true
        }
    }

}

#endif
