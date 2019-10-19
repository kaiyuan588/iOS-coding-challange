//
//  SongsAPI.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import Foundation


class SongsAPI {
    static func getSongs() -> [Songs]{
        let songs = [
        Songs(name: "kaiyuan"),
        Songs(name: "sihan")
        ]
        return songs
    }
}
