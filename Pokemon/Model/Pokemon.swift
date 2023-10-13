//
//  Pokemon.swift
//  Pokemon
//
//  Created by João Gabriel Lavareda Ayres Barreto on 14/04/23.
//

struct EvolutionChain {
    
    var evolutionArray: [[String: AnyObject]]?
    var evolutionIds = [Int]()
    
    init(evolutionArray: [[String: AnyObject]]) {
        self.evolutionArray = evolutionArray
        self.evolutionIds = setEvolutionIds()
    }
    
    func setEvolutionIds() -> [Int] {
        var results = [Int]()
        
        evolutionArray?.forEach({ (dictionary) in
            if let idString = dictionary["id"] as? String {
                guard let id = Int(idString) else { return }
                if id <= 151 {
                    results.append(id)
                }
            }
        })
        return results
    }
}
