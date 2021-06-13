//
//  Board.swift
//  Bingo Scorecard
//
//  Created by Karl Cridland on 13/06/2021.
//

import Foundation
import UIKit

class Board: UIView{
    
    private var tiles = [Tile]()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

