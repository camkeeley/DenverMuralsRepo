//
//  InfoScreenViewController.swift
//  THISAPPTEAM
//
//  Created by Lauren Weiss on 12/15/20.
//

import UIKit

class InfoScreenViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
}
