//
//  GlobalVariables.swift
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
import Foundation

/*
 * These global variables store information about the murals and can be called in different classes when information is desired about the murals.
 */
public var murals = [muralDataModel]()

public var titleOfClickedMural: NSString?

public var firstSetup: Bool = true

public var muralPinClicked: muralDataModel?
