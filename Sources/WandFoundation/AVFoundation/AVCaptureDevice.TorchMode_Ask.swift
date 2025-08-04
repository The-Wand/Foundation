//
//  File.swift
//  WandFoundation
//
//  Created by al on 23/6/25.
//

import AVFoundation.AVCaptureDevice
import Wand

extension AVCaptureDevice.TorchMode {
    
    @inline(__always)
    @discardableResult
    public
    static
    func | (context: Self, handler: @escaping (Self)->() ) -> Core {
        context | Ask.every(handler: handler)
    }
    
    @inline(__always)
    @discardableResult
    public
    static
    func | (context: Self, ask: Ask<Self> ) -> Core {
        
        let wand = Wand.Core.to(context)
        
        //Save ask
        wand.append(ask: ask)
        
        //Request for a first time
        
        //Prepare context
        let device: AVCaptureDevice             = wand.get()
        let desire: AVCaptureDevice.TorchMode   = wand.extract()!
        
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
