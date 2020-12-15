//
//  HomeViewController.swift
//  THISAPPTEAM
//
//  Created by Lauren Weiss on 12/12/20.
//
import UIKit

class HomeViewController: UIViewController {

    
    
    @IBOutlet weak var loginbutton: UIButton!
    
    
    @IBOutlet weak var signupbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginbutton.layer.cornerRadius = 20
        loginbutton.layer.borderWidth = 0
        signupbutton.layer.cornerRadius = 20
        signupbutton.layer.borderWidth = 0
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

