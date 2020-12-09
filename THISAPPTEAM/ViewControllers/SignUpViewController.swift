
//
//  SignUpViewController.swift
//  THISAPPTEAM
//
//  Created by William Keeley on 12/7/20.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var retypedPasswordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func validateSignUp() -> String? {
        
        //Make sure all spaces are filled.
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        retypedPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Error: Please fill out all text fields."
        }
        
        if passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != retypedPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        {
            return "Error: Passwords do not match!"
        }
            
        return nil
    }
    
    
    @IBAction func signupTapped(_ sender: Any) {
        let errorMessage = validateSignUp()
        
        if errorMessage != nil {
            
            showError(errorMessage!)
            
        }
        else{
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                
                if err != nil {
                    
                    print("Error creating user!")
                }
                
                  
                else{
                   
                 
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["uid":result!.user.uid]) { (err) in
                        
                        if err != nil {
                            self.showError("User data not saved in database (account created with password and email, however!")
                        }
                        
                       
                    }
                   
                }
 
               
            }
             
        }
        
        
    }
    
    func showError(_ message:String)
    {
        errorLabel.text = message
        errorLabel.alpha = 1
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
