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

/*
 * Firebase setup class, contains functions to store database information in local struct arrays for easy access.
 */
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
    
    /*
     * Given a mural's title, return the mural data struct pertaining to that mural.
     */
    func getDocumentFromTitle(muralTitle: String)->muralDataModel?
    {
        for each in murals
        {
            if(each.title == muralTitle as NSString)
            {
                return each

            }
        }
        
        return nil
        

    }
    
    /*
     * Given a mural's name, return the file path of its image.
     */
    func getImage(title: NSString)->NSString?
    {
        let storage = Storage.storage()
        var image = UIImage()
        
        for each in murals
        {
            if each.title == title
            {
                
                return each.image
            }
            
        }
        
        return nil
    }
    
    
   
        
    
    /*
     * This function stores the information in the murals database inside an array on the local machine, which allows easy access to database information.
     */
    func getAllDocs()
    {
        firestoreDB.collection("Murals").getDocuments { (snapshot, error) in

            if error == nil && snapshot != nil{
                
                guard let snap = snapshot
                else { return }
                

                //Iterates the entire collection specified in the first line of this method, saves them one at a time to object "document data"
                for document in snap.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                   
                    
                    let documentData = document.data()
                    
                    let storage = Storage.storage()

                    var image:UIImage?

                    let artist = documentData["Artist"] as? NSString ?? ""
                    let title = documentData["Title"] as? NSString ?? ""
                    let longitude = documentData["longitude"] as? Double ?? 0
                    let latitude = documentData["latitude"] as? Double ?? 0
                    let imageRef = documentData["imageRef"] as? NSString ?? ""
                    let description = documentData["Description"] as? NSString ?? ""
                    let timeAndPlaceCreated = documentData["Time and Place"] as? NSString ?? ""
                    let address = documentData["Address"] as? NSString ?? ""
                    
                    let newMural = muralDataModel(title: title, artist: artist, latitude: latitude, longitude: longitude, image: imageRef, description: description, timeAndPlaceCreated: timeAndPlaceCreated, address: address)
                    murals.append(newMural!)

                }
                
                for each in murals {
                    print(each.artist)
                    print("test add murals to array")
                }

            }
            
        }
    
    }

}

