//
//  ViewController.swift
//  THISAPPTEAM
//
//  Created by Lauren Weiss on 12/7/20.
//

import FirebaseDatabase
import Firebase
import UIKit

class ViewController: UIViewController {

    

    
    private let realtimeDB = Database.database().reference()
    private var firestoreDB:FirebaseDB = FirebaseDB()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        firestoreDB.createNewCollection()
        firestoreDB.getAllDocs()
        
        
        
        
        addToDatabase()
        addToDatabase2()
        
        realtimeDB.child("Murals").observe(.value) { (DataSnapshot) in
            guard let value = DataSnapshot.value as? [String: Any] else{
                return
            }
            print("Value: \(value)")
        }
        
    }
    
    private func addToDatabase()
    {
        
        let object: [String: Any] = ["name": ("iOS Academy" as NSObject) as! String, "Youtube": "yes"]
        realtimeDB.child("Murals").setValue(object)
    }

    private func addToDatabase2()
    {
        
        let object: [String: Any] = ["name": ("Swift Academy" as NSObject) as! String, "Youtube": "yes"]
        realtimeDB.child("Murals2").setValue(object)
    }

}

