//
//  FirebaseManagement.swift
//  THISAPPTEAM
//
//  Created by Cameron Keeley on 12/8/20.
//

import FirebaseDatabase
import Foundation
import FirebaseStorage
import Firebase
import FirebaseFirestore
import UIKit

public class FirebaseDB{
    
    private let realtimeDB = Database.database().reference()
    
    let firestoreDB = Firestore.firestore()
    
    func createNewCollection()
    {
        
        
        firestoreDB.collection("newCollection").addDocument(data: ["year":"2017", "type":"Rice Wine", "label":"Grey Goose"])

    }
    
    func getDoc()
    {
        firestoreDB.collection("newCollection").document("tVblSACVytY2HbdB0blp").getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing: )) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
                    
                
            
        
    }
    
    func getDocumentFromTitle(muralTitle: String)->muralDataModel?
    {
//        let docRef = firestoreDB.collection("Murals").whereField("Title", isEqualTo: muralInstance)
        
        for each in murals
        {
            if(each.title == muralTitle as NSString)
            {
                return each

            }
        }
        
        return nil
//        let docRef = firestoreDB.collection("Murals").document(muralTitle)
//        return docRef
        

    }
    
    func getImage(title: NSString)->NSString?
    {
        let storage = Storage.storage()
        var image = UIImage()
        
//        var muralSelected = muralDataModel(title: "", artist: "", latitude: 0, longitude: 0, image: UIImage?)
        for each in murals
        {
            if each.title == title
            {
//                muralSelected?.title = each.title
//                muralSelected?.image = each.image
                
                return each.image

            }
            
        }
        return nil
        
//        let imageURL = muralSelected!.image as String
//        print(imageURL)
//        let ref = storage.reference(forURL: imageURL)

        
//        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
//          if let error = error {
//            // Uh-oh, an error occurred!
//          } else {
//            print("Success!")
//            image = UIImage(data: data!)!
//          }
//        }
    
    }
    
    
    /*
    func getImage(title: NSString)->UIImage?
    {
        let storage = Storage.storage()
        var image = UIImage()
        
        var muralSelected = muralDataModel(title: "", artist: "", latitude: 0, longitude: 0, imageRef: "")
        for each in murals
        {
            if each.title == title
            {
                muralSelected?.title = each.title
                muralSelected?.imageRef = each.imageRef

                break

            }
            
        }
        
        let imageURL = muralSelected?.imageRef
        print(imageURL)
        let ref = storage.reference(forURL: imageURL! as String)

    
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
          } else {
            print("Success!")
            image = UIImage(data: data!)!
          }
        }
        
    
            return image
     */
        /*
        
        let storage = Storage.storage()
        var image = UIImage()
        
        var muralSelected = muralDataModel(title: "", artist: "", latitude: 0, longitude: 0, imageRef: "")
        for each in murals
        {
            if each.title == title
            {
                muralSelected = each
                break

            }
            
        }
        
        let imageURL = muralSelected?.imageRef
        let ref = storage.reference(forURL: imageURL! as String)

        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
          } else {
            
            image = UIImage(data: data!)!
          }
        }
        
    
            return image
        
    }
     */
    func getAllDocs()
    {
        firestoreDB.collection("Murals").getDocuments { (snapshot, error) in

            if error == nil && snapshot != nil{
                
                guard let snap = snapshot
                else { return }
                

                
                for document in snap.documents {
                    //Iterates the entire collection specified in the first line of this method, saves them one at a time to object "document data"
                    print("\(document.documentID) => \(document.data())")
                    
                   
                    
                    let documentData = document.data()
                    
                    let storage = Storage.storage()
//                    let storeRef = storage.reference()
                    
                    
                    

                    
//                    let imageRef = storeRef.child("MuralImages/LaAlmaImage.png")
//                    let imageRef = storage.reference(forURL: docRef?.absoluteString ?? "")

//                    let imageRef = storage.reference(forURL: "gs://chicanomuralsprojectdatabase17.appspot.com/MuralImages/LaAlmaImage.png")
                    
//                    let imageRef = storage.reference(forURL: docRef ?? "")

                    
//                    let imageRef = storage.reference().child("MuralImages/LaAlmaImage.png")
                    
                    var image:UIImage?

                    let artist = documentData["Artist"] as? NSString ?? ""
                    let title = documentData["Title"] as? NSString ?? ""
                    let longitude = documentData["longitude"] as? Double ?? 0
                    let latitude = documentData["latitude"] as? Double ?? 0
                    let imageRef = documentData["imageRef"] as? NSString ?? ""
                    
                    let newMural = muralDataModel(title: title, artist: artist, latitude: latitude, longitude: longitude, image: imageRef)
                    murals.append(newMural!)

                    
//                    let docRef = documentData["imageRef"] as? String
//                    print("Document referenced: \(docRef ?? "")")
//                    //Image stored in array code
//                       imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//                        if error != nil {
//                        // Uh-oh, an error occurred!
//                        print("Error \(error)")
//                      } else {
//                        print("Success2!")
//                        image = UIImage(data: data!)
//                        if(image != nil)
//                        {
//                            print("Success 3")
//                            let artist = documentData["Artist"] as? NSString ?? ""
//                            let title = documentData["Title"] as? NSString ?? ""
//                            let longitude = documentData["longitude"] as? Double ?? 0
//                            let latitude = documentData["latitude"] as? Double ?? 0
//        //                    let imageRef = documentData["imageRef"] as? NSString ?? ""
//
//                            print("Success 4")
//                            let newMural = muralDataModel(title: title, artist: artist, latitude: latitude, longitude: longitude, image: image!)
//                            murals.append(newMural!)
//                        }
//
//                      }
//
//                    }
                    
                    
                    
                  
                   
                    
                   
                    
                    
                    
                    
                    
                    
                }
                
                for each in murals {
                    print(each.artist)
                    print("test add murals to array")
                }

            }
            
        }
    }
    
    
    func getSubsetOfDocs()
    {
        
    }

}

