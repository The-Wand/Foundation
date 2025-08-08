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

#if canImport(AVFoundation) && !targetEnvironment(simulator)
import AVFoundation
import XCTest

import Wand
import WandFoundation

final
class AVFoundation_Tests: XCTestCase {

    @MainActor
    func test_AVCaptureDevice_TorchMode_Get() {

        let e = expectation()
        e.assertForOverFulfill = true
        |.one { (mode: AVCaptureDevice.TorchMode) in

            if mode == self.torchMode()  {
                e.fulfill()
            }

        }

        waitForExpectations()

    }
    @MainActor
    func test_AVCaptureDevice_TorchMode_Set() {

        let e = expectation()
        e.assertForOverFulfill = true

        let mode = AVCaptureDevice.TorchMode.on
        mode | .one { (done: AVCaptureDevice.TorchMode) in

            if mode == self.torchMode()  {
                e.fulfill()
            }

        }

        waitForExpectations()

    }

    private
    func torchMode() -> AVCaptureDevice.TorchMode? {
        AVCaptureDevice.default(for: .video)?.torchMode
    }

}

#endif
