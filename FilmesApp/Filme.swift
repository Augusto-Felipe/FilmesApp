//
//  Filme.swift
//  FilmesApp
//
//  Created by Felipe Augusto Correia on 30/01/23.
//

import Foundation
import UIKit

class Filme {
    var titulo: String
    var descricao: String
    var imagem: UIImage
    
    init(titulo: String, descricao: String, imagem: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
    }
}
