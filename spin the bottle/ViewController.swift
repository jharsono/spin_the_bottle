//
//  ViewController.swift
//  spin the bottle
//
//  Created by Josh Harsono on 3/8/18.
//  Copyright © 2018 Team Bruiser. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        updateUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI(){
        backgroundView.backgroundColor = UIColor(patternImage: UIImage(named:"bottle")!)
    }
}

