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

#if !os(watchOS)
import AVFoundation

import Wand

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureDevice: @retroactive Obtain, @retroactive Wanded {

    public static func obtain(by wand: Wand?) -> Self {

        let deviceType: AVCaptureDevice.DeviceType = wand?.get()
                                                    ?? .builtInWideAngleCamera

        let mediaType: AVMediaType = wand?.get()
                                    ?? .video

        let position: AVCaptureDevice.Position = wand?.get()
                                                ?? .front

        let device = Self.default(deviceType,
                                  for: mediaType,
                                  position: position) as! Self

        return wand?.add(device) ?? device
    }

}

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureDeviceInput: @retroactive Obtain, @retroactive Wanded {

    public static func obtain(by wand: Wand?) -> Self {
        
        guard let wand else {
            fatalError()
        }

        let device: AVCaptureDevice = wand.obtain()
        return wand.add(try! Self(device: device))
    }

}

@available(tvOS 17.0, *)
extension AVCaptureSession: @retroactive Obtain, @retroactive Wanded {

    public static func obtain(by wand: Wand?) -> Self {
        wand?.add(Self()) ?? Self()
    }

}

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureVideoDataOutput: @retroactive Asking, @retroactive Wanded {

    public static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        guard wand.answer(the: ask) else {
            return
        }

        let session: AVCaptureSession = wand.obtain()
        session.beginConfiguration()

        let preset: AVCaptureSession.Preset = wand.get() ?? .high
        session.sessionPreset = preset

        if session.inputs.isEmpty {
            let deviceInput: AVCaptureDeviceInput = wand.obtain()
            session.addInput(deviceInput)
        }

        let output = Self()
        if session.canAddOutput(output) {
            session.addOutput(output)

            let discards: Bool = wand.get(for: "alwaysDiscardsLateVideoFrames") ?? true
            output.alwaysDiscardsLateVideoFrames = discards

            let settings: [String: Any] = wand.get()
            ?? [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
            output.videoSettings = settings

            let delegate = wand.add(Delegate())
            let queue: DispatchQueue = wand.get()
                                    ?? DispatchQueue(label: "Pipe_VideoDataOutput",
                                                     qos: .userInteractive)

            output.setSampleBufferDelegate(delegate, queue: queue)
        } else {
            wand.add(Wand.Error.vision(.internalError,
                                       reason: "Could not add video data output"))
        }
        session.commitConfiguration()
        session.startRunning()

        wand.add(output)

        wand.setCleaner(for: ask) {
            session.stopRunning()
        }
    }


}

@available(watchOS 6, tvOS 17.0, *)
extension AVCaptureVideoDataOutput {

    class Delegate: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, Wanded {

        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            isWanded?.add(sampleBuffer)
        }

    }

}

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureVideoPreviewLayer: @retroactive Obtain, @retroactive Wanded {

    public static func obtain(by wand: Wand?) -> Self {
        let layer = Self()
        layer.videoGravity =    wand?.get() ?? .resizeAspectFill
        layer.session =         wand!.obtain()

        return wand?.add(layer) ?? layer
    }

}

#endif
