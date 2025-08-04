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

import AVFoundation
import CoreBluetooth
import Network
import WandFoundation
import Wand

import SwiftUI

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
@main
struct PlayApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
struct ContentView: View {
    var body: some View {

        VStack {
            Image(systemName: "wand.and.stars")
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
//            AVCaptureDevice.TorchMode.on | .one { done in
//                print(done.rawValue)
//            }

//            var found: CBPeripheral?
//
//            var wand: Core!
//            wand = |{ (peripheral: CBPeripheral) in
//                
//                print(peripheral)
//                
//                if (found != nil) {
//                    return
//                }
//                found = peripheral
//
//                let manager = wand.get() as CBCentralManager
//                manager.connect(peripheral)
//
//            } | { (services: [CBService]) in
//
//                print(services)
//                found!.discoverCharacteristics(nil, for: services.first!)
//
//            } | .one("180A") { (characteristic: [CBCharacteristic]) in
//
//                print(characteristic)
//
//            } | { (error: Error) in
//
//                print(error)
//
//            }

        }

    }
}

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
#Preview {
    ContentView()
}
