//
//  LoginViewController.swift
//  THISAPPTEAM
//
//  Created by Lauren Weiss on 12/12/20.
//


import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {


    @IBOutlet weak var passwordTextField: UITextField!
//
    @IBOutlet weak var loginButton: UIButton!
//
//   @IBOutlet weak var errorLabel: UILabel!
//
//
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    private var firestoreDB:FirebaseDB = FirebaseDB()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
        firestoreDB.getAllDocs()
        firestoreDB.createNewCollection()
        
        
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 0
        
        passwordTextField.layer.cornerRadius = 20
    }
    
    func setUpElements() {
        
        // Hide the error label
//        errorLabel.alpha = 0
        
        // Style the elements
      
    }
    
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
               // self.errorLabel.text = error!.localizedDescription
              //  self.errorLabel.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                //self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
