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
import CoreMedia.CMSampleBuffer
import Vision.VNObservation

import Wand

extension Array: Asking where Element: Asking {

    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        Element.wand(wand, asks: ask)

    }
    

}

extension Array: AskingNil where Element: AskingNil {

}

/// Ask
///
/// prefix |<E: VNObservation> (handler: (E)->() )
///
/// #Usage
/// ```
///
///   |{ (hands: [VNHumanHandPoseObservation]) in
///
///   }
///
///   URL(string: "http://example.com/image.jpg") | { (faces: [VNFaceObservation]) in
///
///   }
///
///   data | .while { (bodies: [VNHumanBodyPoseObservation]) in
///     bodies < 2
///   }
/// ```
///
public
protocol VisionObservationExpectable: AskingNil {

    associatedtype Request: VNRequest

}

public
extension VisionObservationExpectable {

    @inline(__always)
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {


        //Save ask
        guard wand.answer(the: ask, check: true) else {
            return
        }

        //Request for a first time

        //Prepare context

        let perform = { (handler: VNImageRequestHandler) in
            let request: Request = wand.obtain()

            try! handler.perform([request])
            if let results = request.results, !results.isEmpty {
                wand.add(results as! [Self])
            }
        }

        //Make request

        //There is request handler already?
        if let handler: VNImageRequestHandler = wand.get() {
            perform(handler)
        } else {

            #if !os(visionOS)

                if #available(tvOS 17.0, *) {

                    //Otherwise wait for buffer
                    wand | { (buffer: CMSampleBuffer) in

                        let request = VNImageRequestHandler(cmSampleBuffer: buffer)
                        perform(request)
                    }

                } else {
                    //TODO: Fallback on earlier versions
                }

            #endif
        }
    }

}

@available(iOS 14.0, *)
extension VNFaceObservation: VisionObservationExpectable {

    public
    typealias Request = VNDetectFaceRectanglesRequest

}

@available(iOS 14.0, *)
extension VNBarcodeObservation: VisionObservationExpectable {

    public
    typealias Request = VNDetectBarcodesRequest

}

@available(iOS 14.0, macOS 11.0, *)
extension VNHumanHandPoseObservation: VisionObservationExpectable {

    public
    typealias Request = VNDetectHumanHandPoseRequest

    public
    static func | (piped: VNHumanHandPoseObservation,
                   joint: JointName) -> CGPoint {
        let recognized = try! piped.recognizedPoint(joint)
        return CGPoint(x: recognized.location.x, y: 1 - recognized.location.y)
    }

}

@available(iOS 14.0, macOS 11.0, *)
extension VNHumanBodyPoseObservation: VisionObservationExpectable {

    public
    typealias Request = VNDetectHumanBodyPoseRequest

}

@available(iOS 14.0, *)
extension VNClassificationObservation: VisionObservationExpectable {

    public
    typealias Request = VNClassifyImageRequest

}

//<C>?
//public static func start<P, E>(expectating expectation: Expect<E>, with piped: P, on pipe: Pipe) {
//
//    let perform = { (handler: VNImageRequestHandler) in
//        let request = piped as? Request ?? pipe.get()
//
//        try! handler.perform([request])
//        if let results = request.results {
//            pipe.put(results as! [Self])
//        }
//    }
//
//    //There is request handler already?
//    if let handler = piped as? VNImageRequestHandler ?? pipe.get() {
//        perform(handler)
//    } else {
//        //Otherwise wait for buffer
//        pipe | { (buffer: CMSampleBuffer) in
//            perform(buffer|)
//        }
//    }
//}

#endif
