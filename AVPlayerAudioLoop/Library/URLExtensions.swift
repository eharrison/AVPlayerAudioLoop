//
//  URLExtensions.swift
//  AVPlayerAudioLoop
//
//  Created by Evandro Harrison Hoffmann on 30/06/2020.
//  Copyright © 2020 It's Day Off. All rights reserved.
//

import Foundation

extension URL {
    /// Returns url to file in local bundle with given name
    /// - Parameter name: name of animation file
    /// - Returns: URL to local animation
    static func bundleURL(for name: String, fileExtension: String) -> URL? {
        return Bundle.main.url(forResource: name, withExtension: fileExtension, subdirectory: nil)
    }
}
