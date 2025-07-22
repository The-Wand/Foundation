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

#if canImport(UIKit) && !os(watchOS)
import UIKit.UIImage
import Wand

public
extension Ask {

    class Operation: Ask {
    }

}

@inline(__always)
@discardableResult
public
func | (image: Image?, ask: Ask<Image>.Operation) -> Core {
    let wand = Core.to(image)
    _ = wand.append(ask: ask, check: true)
    return wand
}

@available(iOS 15.0, *)
@inline(__always)
@discardableResult
public
func | (url: URL, handler: (UIImage)->()) -> Core {
    let wand = Core.to(url)

//    let cache = URLCache.shared
//
//    let customCache = URLCache(memoryCapacity: 8, diskCapacity: 8, directory: nil)
//
    let request = URLRequest(url: url, timeoutInterval: 30)
//
    let session = URLSession(configuration: .default)
//    let bSession = URLSession(configuration: .background(withIdentifier: "com.wand.image"))

    let task = session.downloadTask(with: request)
    task.delegate = wand.put(Delegate())
    task.resume()

    return wand
}

class Delegate: NSObject, URLSessionDownloadDelegate, Wanded {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {

        print(location)
    }

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {

        let bytes = (bytesWritten: bytesWritten,
                     totalBytesWritten: totalBytesWritten,
                     totalBytesExpectedToWrite: totalBytesExpectedToWrite)

        isWanded?.add(bytes, for: downloadTask|)
    }

}

#endif
