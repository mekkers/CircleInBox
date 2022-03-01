//
//  ViewController.swift
//  CircleInBox
//
//  Created by igor mekkers on 01.03.2022.
//

import UIKit

enum Direction {
    case down
    case right
    case up
    case left
}

class ViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    private let circleView = UIView(frame: CGRect(x: 40, y: 100, width: 70, height: 70))
    private let distance: CGFloat = 250
    private var direction: Direction = .down
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircleView()
        
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        moveView()
    }
    private func addCircleView() {
        circleView.backgroundColor = .green
        circleView.layer.cornerRadius = circleView.frame.size.height / 2
        self.view.addSubview(circleView)
    }
    private func moveView() {
        UIView.animate(withDuration: 0.3) {
            self.changeDirection()
        } completion: { _ in
            self.moveView()
        }
    }
    private func changeDirection() {
        switch direction {
        case .down:
            self.circleView.frame.origin.y += self.distance
            direction = .right
            return
        case .right:
            self.circleView.frame.origin.x += self.distance
            direction = .up
            return
        case .up:
            self.circleView.frame.origin.y -= self.distance
            direction = .left
            return
        case .left:
            self.circleView.frame.origin.x -= self.distance
            direction = .down
            return
        }
    }

}

