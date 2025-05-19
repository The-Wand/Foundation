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
///
/// 

#if canImport(UIKit) && !os(watchOS)
import CoreServices.UTCoreTypes
import UIKit
import UniformTypeIdentifiers

import Wand

/// Obtain
///
/// let ctrl: UIImagePickerController = nil|
///
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension UIImagePickerController: Obtainable {
    
    public
    static
    func obtain(by wand: Core?) -> Self {

        let wand = wand ?? Core()

        let delegate = wand.add(Delegate())
        
        let picker = wand.add(Self())
        picker.allowsEditing = false
        picker.delegate = delegate

        let type: String
        if #available(iOS 14.0, *) {
            type = wand.get() ?? UTType.image.identifier
        } else {
            type = wand.get() ?? "kUTTypeImage"//kUTTypeImage as String
        }
        picker.mediaTypes = [type]

        return wand.add(picker)
    }
    
}

@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension UIImagePickerController {
    
    class Delegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, Wanded {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            picker.dismiss(animated: true)
            
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            isWanded?.add(image)
        }
        
    }
    
}

#endif
