//
//  FirebaseManagement.swift
//  THISAPPTEAM
//
//  Created by William Keeley on 12/8/20.
//


import Foundation
import FirebaseStorage
import Firebase
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
    
    func getTitle(muralInstance: String)
    {
        let docRef = firestoreDB.collection("Murals").whereField("Title", isEqualTo: muralInstance)
        
      

    }
    
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
        
        let imageURL = muralSelected!.imageRef as String
        print(imageURL)
        let ref = storage.reference(forURL: imageURL)

        
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
                    let artist = documentData["Artist"] as? NSString ?? ""
                    let title = documentData["Title"] as? NSString ?? ""
                    let longitude = documentData["longitude"] as? Double ?? 0
                    let latitude = documentData["latitude"] as? Double ?? 0
                    let imageRef = documentData["imageRef"] as? NSString ?? ""
                    
                    let newMural = muralDataModel(title: title, artist: artist, latitude: latitude, longitude: longitude, imageRef: imageRef)
                    
                   murals.append(newMural!)
                    
                    
                    
                }
                
                for each in murals {
                    print(each.artist)
                }

            }
            
        }
    }
    
    
    func getSubsetOfDocs()
    {
        
    }

}

