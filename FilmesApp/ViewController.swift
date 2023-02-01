//
//  ViewController.swift
//  FilmesApp
//
//  Created by Felipe Augusto Correia on 30/01/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes: [Filme] = []
    var filmeSelecionado: Filme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        filmes.append(Filme(titulo: "007 - Spectre", descricao: "descricao", imagem: UIImage(named: "007")!))
        
        filmes.append(Filme(titulo: "Vingadores Ultimato", descricao: "descricao", imagem: UIImage(named: "vingadores-2")!))
        
        filmes.append(Filme(titulo: "Deadpool", descricao: "descricao", imagem: UIImage(named: "deadpool")!))
        
        filmes.append(Filme(titulo: "Hardcore", descricao: "descricao", imagem: UIImage(named: "hardcore")!))
        
        filmes.append(Filme(titulo: "A Herdeira", descricao: "descricao", imagem: UIImage(named: "herdeira")!))
        
        filmes.append(Filme(titulo: "Impacto Mortal", descricao: "descricao", imagem: UIImage(named: "impacto-mortal")!))
        
        filmes.append(Filme(titulo: "Regresso do Mal", descricao: "descricao", imagem: UIImage(named: "regresso-do-mal")!))
        
        filmes.append(Filme(titulo: "O Regresso", descricao: "descricao", imagem: UIImage(named: "regresso")!))
        
        filmes.append(Filme(titulo: "Star Wars", descricao: "descricao", imagem: UIImage(named: "star-wars")!))
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Convertendo para FilmeCelula
        // Filme celula foi criado para podermos customizar a celula da nossa maneira, sem usar os atributos ja prontos do sistema
        let celularReuso = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath) as! FilmeCelula

        //        celularReuso.textLabel?.text = filmes[indexPath.row].titulo
        //        celularReuso.imageView?.image = filmes[indexPath.row].imagem
        
        celularReuso.tituloLabel.text = filmes[indexPath.row].titulo
        celularReuso.descricaoLabel.text = filmes[indexPath.row].descricao
        celularReuso.filmeImageView.image = filmes[indexPath.row].imagem
        
        // Para arredondar, basta colocar a metade da largura do item
        celularReuso.filmeImageView.layer.cornerRadius = 20
        celularReuso.filmeImageView.clipsToBounds = true
        
        return celularReuso
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filmeSelecionado = filmes[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsviewController
            destinationVC.filme = self.filmeSelecionado
        }
    }
    
}

