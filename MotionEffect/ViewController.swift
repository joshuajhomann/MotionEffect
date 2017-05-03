//
//  ViewController.swift
//  MotionEffect
//
//  Created by Joshua Homann on 5/1/17.
//  Copyright © 2017 josh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let colors: [UIColor] = [.blue, .purple, .red, .orange, .yellow]
        let circles: [UIView] = stride(from: 0, to: 5, by: 1).map { index in
            let diameter = 300 - 50 * CGFloat(index)
            let view = UIView()
            view.backgroundColor = colors[index].withAlphaComponent(0.75)
            view.layer.borderColor = colors[index].cgColor
            view.layer.borderWidth = 2
            view.layer.cornerRadius = diameter / 2
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            view.widthAnchor.constraint(equalToConstant: diameter).isActive = true
            view.heightAnchor.constraint(equalToConstant: diameter).isActive = true
            return view
        }

        circles.reversed().enumerated().forEach { (index, view) in
            let displacement = 120 * CGFloat(1 + index)
            view.addMotionDisplacement(xAxisAmount: displacement, yAxisAmount: displacement)
        }
    }
}

