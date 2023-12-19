//
//  Jukebox.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

class Jukebox {
    var availableMusics: [Music]
    var musics: [Music]
    var musicPrice: Float
    
    init(availableMusics: [Music], musics: [Music], musicPrice: Float) {
        self.availableMusics = availableMusics
        self.musics = musics
        self.musicPrice = musicPrice
    }
    
}
