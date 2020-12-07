//
//  MapViewController.swift
//  TSP
//
//  Created by William Keeley on 12/3/20.
//  Copyright © 2020 CamKeeleyApps. All rights reserved.
//
//
//  SecondViewController.swift
//  databasePractice
//
//  Created by William Keeley on 12/1/20.
//  Copyright © 2020 CamKeeleyApps. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
   //longitude and latitude of Denver, CO
   //39.7392° N, 104.9903° W
    
  
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let annotation = MKPointAnnotation()
               annotation.coordinate = CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903)
               annotation.title = "Denver, Colorado"
               annotation.subtitle = "Home of CMCP"
               mapView.addAnnotation(annotation)
               
               // The main neighborhood that our murals are based out of right now
               let annotation_two = MKPointAnnotation()
               annotation_two.coordinate = CLLocationCoordinate2D(latitude: 39.7333, longitude: -105.0054)
               annotation_two.title = "La Alma / Lincoln Park"
               annotation_two.subtitle = "Neighborhood of the murals"
               mapView.addAnnotation(annotation_two)
               
               // Address of La Alma Recreation Center
               let mural_one = MKPointAnnotation()
               mural_one.coordinate = CLLocationCoordinate2D(latitude: 39.735271, longitude: -105.004059)
               mural_one.title = "La Alma Mural"
               mural_one.subtitle = "Artist: Emmanuel Martinez"
               mapView.addAnnotation(mural_one)
               
               // Address of Colorado Charter High School
               let mural_two = MKPointAnnotation()
               mural_two.coordinate = CLLocationCoordinate2D(latitude: 39.734810, longitude: -105.005740)
               mural_two.title = "Past to Future"
               mural_two.subtitle = "Artist: Daniel Lowensteinz"
               mapView.addAnnotation(mural_two)
               
               // Address of La Alma Recreation Center
               let mural_three = MKPointAnnotation()
               mural_three.coordinate = CLLocationCoordinate2D(latitude: 39.73423, longitude: -105.003421)
               mural_three.title = "Cesar Chaves"
               mural_three.subtitle = "Artist: Nick Vigil"
               mapView.addAnnotation(mural_three)
               
               let region = MKCoordinateRegion(center: annotation_two.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
               mapView.setRegion(region, animated: true)
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
