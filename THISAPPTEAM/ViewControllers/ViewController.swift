//
//  ViewController.swift
//  THISAPPTEAM
//
//  Created by 浮生物语 on 2020/12/9.
//

import FirebaseDatabase
import Firebase

import UIKit
import MapKit

/*
 * View controller class for the map view of the app, creates a map, centers it on a location in Denver near a neighborhood of murals, and drops pins on mural locations which can be clicked to view mural data.
 */
class ViewController: UIViewController {
    
    @IBOutlet private var mapView: MKMapView!
    private var firestoreDB:FirebaseDB = FirebaseDB()

    /*
     * This override function sets the initial location of the map, and for each mural
     * entry in the connected database, it creates a pin on the map which can be clicked
     * on to view the information pertaining to that mural.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        
        let initialLocation = CLLocation(latitude: 39.7333, longitude: -105.0054)
        mapView.centerToLocation(initialLocation)
        
        mapView.delegate = self
        
 
        for each in murals
        {
            if(each.title != "")
            {
                let newArtwork = Artwork(title: each.title as String, locationName: each.address as String, discipline: "Murals",
                coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(each.latitude), longitude: CLLocationDegrees(each.longitude)))
             
                print(each.artist as String + "\(each.latitude)" + "\(each.longitude) + 50")
            
                mapView.addAnnotation(newArtwork)
            }
        
         }
    
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

extension ViewController: MKMapViewDelegate {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
          if control == view.rightCalloutAccessoryView {
            
            titleOfClickedMural = (view.annotation?.title)!! as NSString
            performSegue(withIdentifier: "MuralPinViewControllerSegue", sender: self )

          }
    }

}




