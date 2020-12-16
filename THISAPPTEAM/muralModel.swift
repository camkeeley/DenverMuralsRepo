//
//  Mural.swift
//  THISAPPTEAM
//
//  Created by Cameron Keeley on 12/8/20.
//

import Foundation
import UIKit

/*
 * This struct is designed to store information from the murals database. An array of these structs is set up in the FirebaseDB.swift class, for easily-called information storage.
 */
public struct muralDataModel
{
    var title: NSString
    var artist: NSString
    var latitude: Double
    var longitude: Double
//    var image: UIImage
    var image: NSString
    var description: NSString
    var timeAndPlaceCreated: NSString
    var address: NSString
    
    public init?(title: NSString, artist: NSString, latitude: Double, longitude: Double, image: NSString, description: NSString, timeAndPlaceCreated: NSString, address: NSString)
    {
       
        
        self.title = title
        self.artist = artist
        self.latitude = latitude
        self.longitude = longitude
//        self.image = image
        self.image = image
        self.description = description
        self.timeAndPlaceCreated = timeAndPlaceCreated
        self.address = address

    }
 
 
}
