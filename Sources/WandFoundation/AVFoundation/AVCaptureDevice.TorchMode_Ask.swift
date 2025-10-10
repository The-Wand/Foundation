//
//  File.swift
//  WandFoundation
//
//  Created by al on 23/6/25.
//

#if canImport(AVFoundation)
@_exported
import AVFoundation.AVCaptureDevice
@_exported
import Wand

extension AVCaptureDevice.TorchMode: AskingNil {

    @inline(__always)
    public
    static
    func ask<C, T>(with context: C, ask: Wand.Ask<T>) -> Wand.Core {

        let wand = Wand.Core()

        //Prepare context
        let device: AVCaptureDevice = wand.get()

        guard !ask.once else {
            ask.handler(device.torchMode as! T)

            return wand
        }

        //Save ask
        wand.append(ask: ask)

        //Request
        wand.add(device.torchMode)
        return wand
    }


}

//@inline(__always)
//@discardableResult
//prefix
//public
//func | (handler: @escaping (AVCaptureDevice.TorchMode)->() ) -> Core {
//    |Ask.every(handler: handler)
//}
//
//@inline(__always)
//@discardableResult
//prefix
//public
//func | (ask: Ask<AVCaptureDevice.TorchMode> ) -> Core {
//
//    let wand = Wand.Core()
//
//    //Prepare context
//    let device: AVCaptureDevice = wand.get()
//
//    guard !ask.once else {
//        ask.handler(device.torchMode)
//
//        return wand
//    }
//
//    //Save ask
//    wand.append(ask: ask)
//
//    //Request
//    wand.add(device.torchMode)
//    return wand
//}

extension AVCaptureDevice.TorchMode {

    @inline(__always)
    @discardableResult
    public
    static
    func | (desire: Self, ask: Ask<Self> ) -> Core {

        let wand = Wand.Core()

        //Save ask
        wand.append(ask: ask)

        //Request for a first time

        //Prepare context
        let device: AVCaptureDevice = wand.get()

        guard device.isTorchAvailable else {
            wand.add(Core.Error.avFoundation(.torchLevelUnavailable))
            return wand
        }

        if device.torchMode != desire {

            do {
                try device.lockForConfiguration()

                if desire == .on {
                    try device.setTorchModeOn(level: wand.get() ?? 1)
                } else {
                    device.torchMode = desire
                }

                device.unlockForConfiguration()
            } catch {
                wand.add(error)
            }

        }

        wand.add(desire)


        return wand
    }

}

#endif
