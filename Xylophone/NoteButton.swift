//
//  NoteButton.swift
//  Xylophone
//
//  Created by Nikita Shirobokov on 02.12.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class NoteButton: UIButton {
    func configure(with note: Note, index: Int, totalCount: CGFloat, verticalStack: UIStackView) {
        self.tag = index
        self.backgroundColor = note.color
        self.setTitleColor(.white, for: .normal)
        self.setTitle(note.name, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let multiplier = 1 - (CGFloat(index) / totalCount * 0.2)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: verticalStack.widthAnchor, multiplier: multiplier)
        ])
    }
}
