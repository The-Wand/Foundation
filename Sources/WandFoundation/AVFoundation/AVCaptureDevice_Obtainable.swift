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

#if canImport(AVFoundation) && !os(watchOS) && !os(visionOS)
import AVFoundation.AVCaptureDevice
import Wand

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureDevice: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {

        let mediaType: AVMediaType = wand?.get() ?? .video
        
        let device = if let deviceType: AVCaptureDevice.DeviceType = wand?.get() {
            `default`(deviceType,
                      for: mediaType,
                      position: wand?.get() ?? .front) as! Self
        } else {
            `default`(for: mediaType) as! Self
        }

        return wand?.add(device) ?? device
    }

}

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureDeviceInput: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {
        
        guard let wand else {
            fatalError()
        }

        let device: AVCaptureDevice = wand.get()
        return wand.add(try! Self(device: device))
    }

}

#endif
