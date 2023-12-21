//
//  main.swift
//  Desafio-Jukebox
//
//  Created by Yuri Fonseca on 19/12/23.
//

import Foundation

/*
 Estruturas:
 - Musica contendo o id, o nome da música, o artista da música, a duração e pode ter ou não uma nota para a música;
 - Artista contendo o id e o nome do artista;
 - Jukebox contendo a lista de músicas disponíveis, a fila de músicas a serem tocadas e o preço para escolher uma música;
 - Usuário contendo o id, o nome, o dinheiro e pode ter ou não a idade do usuário.

 - Outras duas funções de consultas de músicas também devem estar disponíveis na Jukebox uma pelo id e outra pelo nome da musica
 - Também deve estar disponível uma consulta de todas as músicas disponíveis
 - e todas as músicas de determinado artista passando por id ou pelo nome do artista
 - O Jukebox deve saber como retirar uma música já escolhida (sem estorno para o usuário)
 - e como listar as músicas mais tocadas (mais escolhidas) quando for solicitado - crie uma função para isso
 - Por último uma função que retorna a fila de músicas escolhidas.
 */

let myJukebox = Jukebox()
let user = User(id: 0, name: "Yuri", credits: 30)

myJukebox.selectMusic(name: "Hound Dog", user: user)
myJukebox.selectMusic(name: "Somebody to Love", user: user)
myJukebox.selectMusic(id: 2, user: user)
// Caso a função for chamada mais uma vez, o usuário não irá ter dinheiro suficiente.
//myJukebox.selectMusic(id: 0, user: users[0])


let musicsToPlay = myJukebox.getMusicsToPlay()
for music in musicsToPlay {
    myJukebox.playMusic(id: music.id)
}





