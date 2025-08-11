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

#if canImport(UIKit)
import UIKit
import XCTest

import WandFoundation

class ImageTestCase: XCTestCase {

    internal
    let path = "https://www.apple.com/ac/structured-data/images/open_graph_logo.png"

    internal
    lazy
    var url = URL(string: path)!

    internal
    lazy
    var image: UIImage? = UIImage(data: try! Data(contentsOf: url)) // url|

    internal
    lazy
    var inSize = image!.size

}

#endif
