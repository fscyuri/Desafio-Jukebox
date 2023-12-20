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
    
    func searchMusic(id: Int) -> Music? {
        return availableMusics.first { $0.id == id }
    }
    
    func searchMusic(name: String) -> Music? {
        return availableMusics.first { $0.name == name }
    }
    
    func searchAllAvailableMusics() -> [Music] {
        return availableMusics
    }
    
    func searchMusicByArtist(id: Int) -> [Music] {
        let artistMusics = availableMusics.filter { music in
            music.artist.id == id
        }
        
        return artistMusics
    }

    func searchMusicByArtist(name: String) -> [Music] {
        let artistMusics = availableMusics.filter { music in
            music.artist.name == name
        }
        
        return artistMusics
    }
    
}
