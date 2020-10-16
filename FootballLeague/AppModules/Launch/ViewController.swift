//
//  ViewController.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.navigate(type: .modalWithNavigation, module: GeneralRoute.ListOfTeams, completion: nil)
        }
    }


}

