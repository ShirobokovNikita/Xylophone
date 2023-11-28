//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func createViews() {
        for color in Colors.allCases {
            let view = UIView()
            view.backgroundColor = color.color
        }
    }
    
    enum Colors: CaseIterable {
        case red, orange, yellow, green,
             cyan, blue, purple
        
        var color: UIColor {
            switch self {
            case .red:
                return .red
            case .orange:
                return.orange
            case .yellow:
                return.yellow
            case .green:
                return .green
            case .cyan:
                return .cyan
            case .blue:
                return .blue
            case .purple:
                return .purple
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }

    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 1
        return verticalStack
    }()
    
    private lazy var viewXylophone: UIView = {
        let viewXylophone = UIView()
        return viewXylophone
    }()
}


