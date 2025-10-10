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


#if !os(watchOS)
@_exported
import AVFoundation
@_exported
import Wand


postfix
public
func | (piped: Core.Resource) -> AVPlayerLayer {
    AVPlayerLayer(player: piped|)
}

postfix
public
func | (piped: AVPlayer) -> AVPlayerLayer {
    AVPlayerLayer(player: piped)
}

postfix
public
func | (piped: Core.Resource) -> AVPlayer {
    AVPlayer(url: piped|)
}

public
extension Core.Error {

    static func avFoundation(_ code: AVError.Code, reason: String? = nil) -> Error {
        Self(code: code.rawValue, reason: reason ?? "")
    }

}

#endif
