///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

#if canImport(Foundation)
import Foundation
import Wand

public
protocol Rest_Model: Model, Asking, Codable {

    static 
    var base: String? {get}
    static
    var path: String {get}

    static 
    var headers: [String : String]? {get}

//    static
//    func wand<T>(_ wand: Wand, asks ask: Ask<T>)

}

public
extension Ask {

    class Get: Ask {
    }

    class Post: Ask {
    }

    class Put: Ask {
    }

    class Delete: Ask {
    }

}

extension Rest_Model {

    public
    static
    var path: String? {
        nil
    }
    
    public
    static
    var headers: [String : String]? {
        nil
    }

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        guard wand.answer(the: ask) else {
            return
        }
        
        wand | .one { (data: Data) in

            do {

                if
                    let method: Rest.Method = wand.get(),
                    method != .GET,
                    let object: Self = wand.get()
                {
                    wand.add(object)
                } else {

                    let D = T.self as! Decodable.Type
                    
                    let parsed = try JSONDecoder().decode(D.self, from: data)

                    wand.add(parsed as! T)
                }
            } catch(let e) {
                wand.add(e)
            }

            wand.close()
        }
        
    }
    
}

//public
//extension Ask {
//
//    static 
//    func get(handler: @escaping (T)->() ) -> Get {
//        .one(handler: handler)
//    }
//
//    static 
//    func post(handler: @escaping (T)->() ) -> Post {
//        Post.one(handler: handler)
//    }
//
//    static 
//    func put(handler: @escaping (T)->() ) -> Put {
//        .one(handler: handler)
//    }
//
//    static 
//    func delete(handler: @escaping (T)->() ) -> Delete {
//        .one(handler: handler)
//    }
//
//}

//public
//extension Ask where T == Array<Any> {
//
//    static func get(handler: @escaping (T)->() ) -> Get {
//        .one(handler: handler)
//    }
//
//}
//

#endif
