//
//  Jukebox.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

class Jukebox {
    var availableMusics: [Music]
    var musicsToPlay: [Music]
    var musicPrice: Float
    
    init(availableMusics: [Music], musicsToPlay: [Music], musicPrice: Float) {
        self.availableMusics = availableMusics
        self.musicsToPlay = musicsToPlay
        self.musicPrice = musicPrice
    }
    
    func playMusic(id: Int) {
        if let music = searchMusic(id: id) {
            print(music.description())
        } else {
            print("Music not available to play")
        }
    }
    
    func selectMusic(id: Int, user: User) {
        if (user.credits >= musicPrice){
            if let music = searchMusic(id: id) {
                user.credits -= musicPrice
                music.timesPlayed += 1
                musicsToPlay.append(music)
            }
        }
        else {
            print("User doesn't have enough credits.")
        }
    }
    
    func selectMusic(name: String, user: User) {
        if (user.credits >= musicPrice){
            if let music = searchMusic(name: name) {
                user.credits -= musicPrice
                music.timesPlayed += 1
                musicsToPlay.append(music)
            }
        }
        else {
            print("User doesn't have enough credits.")
        }
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
    
    func removeMusic(name: String) {
        if let indexToRemove = musicsToPlay.firstIndex(where: {$0.name == name}){
            musicsToPlay.remove(at: indexToRemove)
        }
    }
    
    func mostPlayedMusics() -> [Music] {
        let vector = availableMusics.sorted(by: {$0.timesPlayed > $1.timesPlayed})
        return vector.filter {music in music.timesPlayed > 0}
    }
    
    func getMusicsToPlay() -> [Music] {
        return musicsToPlay
    }

    
}
