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

#if canImport(Foundation)
import Foundation.NSNotification
import Wand

/// Ask
///
/// UIApplication.didBecomeActiveNotification | { (n: Notification) in
///
/// }
///
extension Notification: Asking, Wanded  {
    
    @inlinable
    public
    static
    func ask<C, T>(with context: C, ask: Ask<T>) -> Core {
        
        let wand = Wand.Core.to(context)
        
        let name: Notification.Name = wand.get()!
        let key = name.rawValue

        ask.key = key

        //Save ask
        guard wand.append(ask: ask) else {
            return wand
        }

        //Prepare context
        let center: NotificationCenter = wand.get()

        //Start listening
        let token = center.addObserver(forName: name,
                                       object: nil,
                                       queue: nil) { notification in
            wand.add(notification, for: key)
        }

        //Set the cleaner
        wand.setCleaner(for: ask) {
            center.removeObserver(token)
        }
        
        return wand

    }

}

@discardableResult
@inline(__always)
public
func | (name: Notification.Name, handler: @escaping (Notification)->() ) -> Core {
    Core.to(name) | .every(handler: handler)
}

@discardableResult
@inline(__always)
public
func | (name: Notification.Name, ask: Ask<Notification>) -> Core {
    Core.to(name) | ask
}

#endif
