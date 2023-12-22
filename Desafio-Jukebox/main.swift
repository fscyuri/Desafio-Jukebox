//
//  main.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

let myJukebox = Jukebox()
let user = User(id: 0, name: "Yuri", credits: 30)

myJukebox.selectMusic(name: "Hound Dog", user: user)
myJukebox.selectMusic(name: "Somebody to Love", user: user)
myJukebox.selectMusic(id: 2, user: user)
// Caso a função for chamada mais uma vez, o usuário não irá ter dinheiro suficiente.
//myJukebox.selectMusic(id: 0, user: users[0])

// Funções de consulta
let musicFoundByID = myJukebox.searchMusic(id: 0)
let musicFoundByName = myJukebox.searchMusic(name: "Somebody to Love")
// Exibe descrição das musicas
myJukebox.playMusic(id: musicFoundByID!.id)
myJukebox.playMusic(id: musicFoundByName!.id)

let allMusicsFound = myJukebox.searchAllAvailableMusics()
let allArtistMusicsFoundByID = myJukebox.searchMusicByArtist(id: 2)
let allArtistMusicsFoundByName = myJukebox.searchMusicByArtist(name: "O Rappa")

// Função para remover musicas de fila musicsToPlay
myJukebox.removeMusic(name: "Hound Dog")
if myJukebox.searchSelectedMusic(name: "Hound Dog") != nil {
    print("Music not removed.")
} else {
    print("Music removed from musicsToPlay.")
}

let musicsByTimesPlayed = myJukebox.getMostPlayedMusics()




