//
//  PokedexCell.swift
//  Pokemon
//
//  Created by João Gabriel Lavareda Ayres Barreto on 12/03/23.
//

import Foundation
import FetchPokemonsPod
import UIKit

protocol PokedexCellDelegate {
    func presentInfoView(withPokemon pokemon: FetchPokemonsPod.Pokemon)
}

class PokedexCell: UICollectionViewCell {
    
    var delegate: PokedexCellDelegate?
    
    var pokemon: FetchPokemonsPod.Pokemon? {
        didSet {
            nameLabel.text = pokemon?.name
            imageView.image = pokemon?.image
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGroupedBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        
        view.addSubview(nameLabel)
        nameLabel.center(inView: view)
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Bulbasaur"
        
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configurePressRecoginzer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
        
    }
    
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            guard let pokemon = self.pokemon else {return}
            delegate?.presentInfoView(withPokemon: pokemon)
        }
    }
    
    func configurePressRecoginzer() {
        let longPressRecoginzer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(longPressRecoginzer)
    }
    
}
