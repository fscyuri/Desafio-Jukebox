//
//  Jukebox.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

class Jukebox {
    var availableMusics = [Music]()
    var musicsToPlay = [Music]()
    var musicPrice: Int = 10
    
    init() {
        setupJukebox()
    }
    
    func setupJukebox() {
        let artists = [
            Artist(id: 0, name: "Elvis Presley"),
            Artist(id: 1, name: "Queen"),
            Artist(id: 2, name: "O Rappa"),
            Artist(id: 3, name: "The Weeknd"),
            Artist(id: 4, name: "Mamonas Assassinas")
        ]

        availableMusics = [
            Music(id: 0, name: "Hound Dog", artist: artists[0], duration: 2.16),
            Music(id: 1, name: "Somebody to Love", artist: artists[1], duration: 4.55, score: "8.2"),
            Music(id: 2, name: "O que sobrou do céu", artist: artists[2], duration: 4.10, score: "7.5"),
            Music(id: 3, name: "Auto-reverse", artist: artists[2], duration: 4.45),
            Music(id: 4, name: "Blinding Lights", artist: artists[3], duration: 3.21),
            Music(id: 5, name: "Vira-vira", artist: artists[4], duration: 2.23),
        ]
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
    
    func searchSelectedMusic(name: String) -> Music? {
        return musicsToPlay.first { $0.name == name}
    }
    
    func removeMusic(name: String) {
        if let indexToRemove = musicsToPlay.firstIndex(where: {$0.name == name}){
            musicsToPlay.remove(at: indexToRemove)
        }
    }
    
    func getMostPlayedMusics() -> [Music] {
        let vector = availableMusics.sorted(by: {$0.timesPlayed > $1.timesPlayed})
        return vector.filter {music in music.timesPlayed > 0}
    }
    
    func getMusicsToPlay() -> [Music] {
        return musicsToPlay
    }

    
}
