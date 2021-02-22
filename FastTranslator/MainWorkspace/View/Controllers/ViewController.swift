//
//  ViewController.swift
//  FastTranslator
//
//  Created by User1 on 18.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScreenTableView: UITableView!
    var gradientLayer = BackgroundGradient.gradientLayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mainScreenTableView.alpha = 0// .backgroundColor = .clear
        setupBackground()
        // Do any additional setup after loading the view.
    }
    
    private func setupBackground() {
        view.backgroundColor = .clear // .none
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0) //view.addSubview(gradientLayer) ///insertSubview
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        gradientLayer.frame = CGRect(origin: gradientLayer.frame.origin, size: size)
    }


}

