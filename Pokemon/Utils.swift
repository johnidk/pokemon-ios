//
//  Utils.swift
//  Pokemon
//
//  Created by João Gabriel Lavareda Ayres Barreto on 11/03/23.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static func mainPink() -> UIColor {
        return UIColor.rgb(red: 223, green: 94, blue: 86)
    }
}



private enum Colors {
    static let darkBlue = UIColor(red:18, green:78, blue:127, alpha: 1.0)
    static let lightBlue = UIColor(red:1, green:161, blue:228, alpha: 1.0)
    static let orange = UIColor(red:251, green:207, blue:59, alpha: 1.0)
    static let white = UIColor(red:255, green:255, blue:255, alpha: 1.0)
}

enum TextColor {
    static let highlight = Colors.lightBlue
    static let primary = Colors.white
    static let title = Colors.darkBlue
}

enum BackgroundColor {
    static let main = Colors.darkBlue
    static let navigation = Colors.orange
    static let overlay = Colors.darkBlue.withAlphaComponent(0.5)
}

extension UINavigationController {
    func applyCustomAppearence() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: TextColor.title]
        navBarAppearance.titleTextAttributes = [.foregroundColor: TextColor.title]
        navBarAppearance.backgroundColor = .mainPink()

        navigationBar.compactAppearance = navBarAppearance
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationBar.isTranslucent = false
    }
    
}

extension UIView {
    
    func center(inView view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
