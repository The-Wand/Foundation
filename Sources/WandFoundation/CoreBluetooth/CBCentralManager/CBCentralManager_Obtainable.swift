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

#if canImport(CoreBluetooth)
import CoreBluetooth.CBCentralManager
import Wand

/// Obtain
///
/// let manager: CBCentralManager = nil|
///
extension CBCentralManager: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {

        let wand = wand ?? Core()

        let source = Self(delegate: wand.add(Delegate()),
                          queue:    wand.get(),
                          options:  wand.get())
        return source
    }

}

#endif
