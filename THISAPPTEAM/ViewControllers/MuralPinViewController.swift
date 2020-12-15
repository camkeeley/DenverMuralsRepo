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

/*
 * View controller for the pin view screen, sets the information on the screen to what is contained in the database for the clicked-on mural.
 */
class MuralPinViewController: UIViewController{
   // @IBOutlet private var mapView: MKMapView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var TitleText: UITextView!
    
    @IBOutlet weak var TimeAndPlaceCreatedText: UITextView!
    
    @IBOutlet weak var ArtistText: UITextView!
    
    @IBOutlet weak var DescriptionText: UITextView!
    
    
    let storage = Storage.storage()

    private var firestoreDB:FirebaseDB = FirebaseDB()

    /*
     *This override function sets all of the data in the mural viewer window to the data contained in that mural's database entry.
     */
    override func viewDidLoad() {

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
                
                DescriptionText.text = each.description as String
                ArtistText.text = each.artist as String
                TitleText.text = each.title as String
                TimeAndPlaceCreatedText.text = each.timeAndPlaceCreated as String
            }
        }
        
    
    }

}
