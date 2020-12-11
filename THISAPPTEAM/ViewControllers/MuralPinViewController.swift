//
//  Mural1.swift
//  THISAPPTEAM
//
//  Created by 浮生物语 on 2020/12/9.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage

class MuralPinViewController: UIViewController{
   // @IBOutlet private var mapView: MKMapView!
    
    @IBOutlet weak var imageView: UIImageView!
    let storage = Storage.storage()

    private var firestoreDB:FirebaseDB = FirebaseDB()

    override func viewDidLoad() {

        
        
//        let storage = Storage.storage()
//        let storeRef = storage.reference()
//
////        let muralClickedRef = muralPinClicked.image
////
//        let imageRef = storeRef.child("MuralImages/LaAlmaImage.png")
//        print(imageRef)
//
//        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if error != nil {
//            // Uh-oh, an error occurred!
//            print("Error \(error)")
//          } else {
//            print("Success!")
//            self.imageView.image = UIImage(data: data!)
//
//          }
//
//        }
        //            muralPinClicked = firestoreDB.getDocumentFromTitle(muralTitle: (view.annotation?.title)!!)

        
        for each in murals
        {
            if(each.title == titleOfClickedMural)
            {
                let imageRef = storage.reference(forURL: (each.image) as String)

                imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if error != nil {
                    // Uh-oh, an error occurred!
                    print("Error \(error)")
                  } else {
                    
                    
                    
                        self.imageView.image = UIImage(data: data!)

                        
                  }
                }
            }
        }
        
    
    }

}
