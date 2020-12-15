////
////  DemoImageRetrievalViewController.swift
////  THISAPPTEAM
////
////  Created by Cameron Keeley on 12/9/20.
////
//
//import UIKit
//import Firebase
//import FirebaseStorage
//import SDWebImage
//
//class DemoImageRetrievalViewController: UIViewController {
//
//
//    @IBOutlet weak var imageView: UIImageView!
//    private var firestoreDB:FirebaseDB = FirebaseDB()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//
//        /*
//        let storageRef = storage.reference()
//
//
//
//        let refURL = URL(string: firestoreDB.getImage(title: "La Alma") as! String)!
//        print(firestoreDB.getImage(title: "La Alma") as! String)
//
//        let placeholderImage = UIImage(named: "placeholder.jpg")
//
//
//
//        imageView.sd_setImage(with: refURL, placeholderImage:placeholderImage)
// */
//
//        let storage = Storage.storage()
//        let storeRef = storage.reference()
//        let imageRef = storeRef.child("MuralImages/LaAlmaImage.png")
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
//        }
//
////        imageView.image = UIImage(firestoreDB.getImage(title:"La Alma"))
//
////        imageView.sd_setImage(with: firestoreDB.getImage(title:"La Alma"), completed: <#T##SDExternalCompletionBlock?##SDExternalCompletionBlock?##(UIImage?, Error?, SDImageCacheType, URL?) -> Void#>)
////
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
