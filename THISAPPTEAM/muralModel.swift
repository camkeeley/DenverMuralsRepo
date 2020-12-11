//
//  Mural.swift
//  THISAPPTEAM
//
//  Created by William Keeley on 12/8/20.
//

import Foundation
import UIKit


public struct muralDataModel
{
    var title: NSString
    var artist: NSString
    var latitude: Double
    var longitude: Double
//    var image: UIImage
    var image: NSString

    
    public init?(title: NSString, artist: NSString, latitude: Double, longitude: Double, image: NSString)
    {
       
        
        self.title = title
        self.artist = artist
        self.latitude = latitude
        self.longitude = longitude
//        self.image = image
        self.image = image

    }
 
 
}
