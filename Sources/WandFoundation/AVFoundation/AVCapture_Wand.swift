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
import AVFoundation
import Wand

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureDevice: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {

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

@available(tvOS 17.0, *)
extension AVCaptureSession: Obtainable {

    public
    static
    func obtain(by wand: Core?) -> Self {
        wand?.add(Self()) ?? Self()
    }

}

@available(tvOS 17.0, *)
@available(visionOS, unavailable)
extension AVCaptureVideoDataOutput: Asking {
    
    public
    static
    func ask<C, T>(with context: C, ask: Ask<T>) -> Core {

        let wand = Wand.Core.to(context)
        
        guard wand.append(ask: ask) else {
            return wand
        }

        let session: AVCaptureSession = wand.get()
        session.beginConfiguration()

        let preset: AVCaptureSession.Preset = wand.get() ?? .high
        session.sessionPreset = preset

        if session.inputs.isEmpty {
            let deviceInput: AVCaptureDeviceInput = wand.get()
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
            wand.add(Core.Error.vision(.internalError,
                                       reason: "Could not add video data output"))
        }
        session.commitConfiguration()

        Task.detached(priority: .userInitiated) {
            session.startRunning()
        }

        wand.add(output)

        wand.setCleaner(for: ask) {
            session.stopRunning()
        }
        
        return wand
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
extension AVCaptureVideoPreviewLayer: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {

        let layer = Self()
        layer.videoGravity =    wand?.get() ?? .resizeAspectFill
        layer.session =         wand!.get()

        return wand?.add(layer) ?? layer
        
    }

}

#endif
