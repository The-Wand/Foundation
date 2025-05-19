//
//  File.swift
//  
//
//  Created by al on 01.05.2024.
//

#if canImport(Vision)
import Vision
import Wand

@available(iOS 13.0, *)
public
extension Core.Error {

    static func vision(_ code: VNErrorCode, reason: String? = nil) -> Error {
        Self(code: code.rawValue, reason: reason ?? "")
    }

}

#endif
