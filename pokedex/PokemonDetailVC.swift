//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Harris on 08/03/2017.
//  Copyright © 2017 Harris. All rights reserved.
//

import UIKit



class PokemonDetailVC: UIViewController {

    
    var pokemon: Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        pokedexLbl.isHidden = false
        pokemon.downloadPokemonDetails {
            
            
            //called when network call complete
            self.updateUI()
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        attackLbl.text = pokemon.attack
        attackLbl.isHidden = false
        
        defenceLbl.text = pokemon.defence
        defenceLbl.isHidden = false
        heightLbl.text = pokemon.height
        heightLbl.isHidden = false
        weightLbl.text = pokemon.weight
        weightLbl.isHidden = false
        typeLbl.text = pokemon.type
        typeLbl.isHidden = false
        dsecrptionLbl.text = pokemon.description
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) = LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var dsecrptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
