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

#if canImport(Vision)
import CoreGraphics.CGImage
import CoreImage.CIImage

import Vision.VNRequest
import Wand

/// Obtain
///
/// let q: VNImageRequestHandler = nil|
///
@available(iOS 11, macOS 10.13, tvOS 11, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension VNImageRequestHandler: @retroactive Obtain, @retroactive Wanded {

    @inline(__always)
    public
    static
    func obtain(by wand: Wand?) -> Self {

        guard let wand else {
            fatalError()
        }

        let orientation: CGImagePropertyOrientation = wand.get() ?? .up
        let options: [VNImageOption : Any] = wand.get() ?? [:]

        let request: Self
        if let buffer: CMSampleBuffer = wand.get() {
            if #available(iOS 14.0, macOS 11.0, tvOS 14, *) {
                request = Self(cmSampleBuffer: buffer,
                               orientation: orientation,
                               options: options)
            } else {
                fatalError()
            }

            return wand.add(request)
        }

        if let pixelBuffer: CVPixelBuffer = wand.get() {
            if #available(iOS 14.0, macOS 11.0, *) {
                request = Self(cvPixelBuffer: pixelBuffer,
                               orientation: orientation,
                               options: options)
            } else {
                fatalError()
            }

            return wand.add(request)
        }

        if let image: CGImage = wand.get() {
            request = Self(cgImage: image,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        if let image: CIImage = wand.get() {
            request = Self(ciImage: image,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        if let data: Data = wand.get() {
            request = Self(data: data,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }

        if let url: URL = wand.get() {
            request = Self(url: url,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        fatalError( """
                    🔥 It's yet not possible to construct
                    \(self)
                    """)
    }

}

//<C>?
//public static func construct<P>(with piped: P, on pipe: Pipe) -> Self {
//
//    let orientation: CGImagePropertyOrientation = pipe.get() ?? .up
//    let options: [VNImageOption : Any] = pipe.get() ?? [:]
//
//    let request: Self
//    switch piped {
//        case let buffer as CMSampleBuffer:
//            if #available(iOS 14.0, macOS 11.0, *) {
//                request = Self(cmSampleBuffer: buffer, orientation: orientation, options: options)
//            } else {
//                fatalError()
//            }
//
//        case let image as CGImage:
//            request = Self(cgImage: image, orientation: orientation, options: options)
//        case let image as CIImage:
//            request = Self(ciImage: image, orientation: orientation, options: options)
//
//        case let data as Data:
//            request = Self(data: data, orientation: orientation, options: options)
//
//        case let url as URL:
//            request = Self(url: url, orientation: orientation, options: options)
//
//        default:
//            fatalError("""
//                                🔥 It's yet not possible to construct
//                                \(self)
//                                from
//                                \(String(describing: piped))
//                           """)
//    }
//
//    return request
//    }
#endif
