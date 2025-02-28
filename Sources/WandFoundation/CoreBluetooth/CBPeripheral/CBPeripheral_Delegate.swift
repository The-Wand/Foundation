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

public
extension CBPeripheral {

    class Delegate: NSObject, CBPeripheralDelegate, Wanded {

        @inlinable
        public
        func peripheral(_ peripheral: CBPeripheral,
                        didDiscoverServices error: Error?) {

            isWanded?.addIf(exist: error)
            isWanded?.addIf(exist: peripheral.services)
        }

        @inlinable
        public
        func peripheral(_ peripheral: CBPeripheral,
                        didDiscoverCharacteristicsFor service: CBService,
                        error: Error?) {

            isWanded?.addIf(exist: error)
            isWanded?.addIf(exist: service.characteristics,
                            for: service.uuid.uuidString)
        }

        public
        func peripheral(_ peripheral: CBPeripheral,
                        didUpdateValueFor characteristic: CBCharacteristic,
                        error: Error?) {

            isWanded?.addIf(exist: error)
            isWanded?.add(characteristic,
                          for: characteristic.uuid.uuidString)
        }

        @inlinable
        public
        func peripheral(_ peripheral: CBPeripheral,
                        didDiscoverDescriptorsFor characteristic: CBCharacteristic,
                        error: Error?) {

            isWanded?.addIf(exist: error)
            isWanded?.add(characteristic.descriptors,
                          for: characteristic.uuid.uuidString)
        }
        
    }
    
}

#endif
