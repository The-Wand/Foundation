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
import CoreBluetooth.CBCentralManager
import Wand

public
extension CBCentralManager {

    public
    class Delegate: NSObject, CBCentralManagerDelegate, Wanded {

        public
        enum Keys: String {
            case didConnect = "CBPeripheral.didConnect"
            case didDisconnectPeripheral = "CBPeripheral.didDisconnectPeripheral"
        }

        @inlinable
        public
        func centralManagerDidUpdateState(_ central: CBCentralManager) {
            isWanded?.add(central.state)
        }

        @inlinable
        public
        func centralManager(_ central: CBCentralManager,
                            didDiscover peripheral: CBPeripheral,
                            advertisementData: [String : Any],
                            rssi RSSI: NSNumber) {
            isWanded?.add(peripheral)
            isWanded?.add((peripheral, advertisementData, RSSI))
        }

        @inlinable
        public
        func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
            isWanded?.add(peripheral, for: Keys.didConnect.rawValue)
        }

        @inlinable
        public
        func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
            isWanded?.add(error)
        }

        @inlinable
        public
        func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {

            if let error = error {
                isWanded?.add(error)
                return
            }

            isWanded?.add(peripheral, for: Keys.didDisconnectPeripheral.rawValue)
        }

        @inlinable
        public
        func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
            if let error = error {
                isWanded?.add(error)
                return
            }

            isWanded?.add(peripheral.services)
        }

    }

}

#endif
