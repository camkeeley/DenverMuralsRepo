//
//  LogInViewController.swift
//  THISAPPTEAM
//
//  Created by Cameron Keeley on 12/9/20.
//

import UIKit
/*
 * This ViewController controls the first page opened when running the apps, and stores mural database information to an array of local structs by calling the function getAllDocs.
 */
class LogInViewController: UIViewController {

    private var firestoreDB:FirebaseDB = FirebaseDB()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firestoreDB.getAllDocs()
        firestoreDB.createNewCollection()
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
