//
//  ViewController.swift
//  THISAPPTEAM
//
//  Created by Lauren Weiss on 12/7/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initialLocation = CLLocation(latitude: 39.7333, longitude: -105.0054)
        mapView.centerToLocation(initialLocation)
        
        mapView.delegate = self
        
        let artwork = Artwork(
            title: "La Alma / Lincoln Park",
            locationName: "Neighborhood of the murals",
            discipline: "Murals",
            coordinate: CLLocationCoordinate2D(latitude: 39.7333, longitude: -105.0054))
        
        let artwork2 = Artwork(
            title: "Past to Future",
            locationName: "Artist: Daniel Lowensteinz",
            discipline: "Murals",
            coordinate: CLLocationCoordinate2D(latitude: 39.734810, longitude: -105.005740))
        mapView.addAnnotation(artwork)
        mapView.addAnnotation(artwork2)
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
//            print(view.annotation?.title)
//            performSegue(withIdentifier: "PinClickSegue", sender: self )
            //user go to La Alma
            if view.annotation?.title == "La Alma / Lincoln Park"
            {
              print(view.annotation?.title)
              performSegue(withIdentifier: "Mural1", sender: self )
            }

            // user go to Past to Future
            if view.annotation?.title == "Past to Future"
            {
              print(view.annotation?.title)
              performSegue(withIdentifier: "Mural2", sender: self)
            }
            
          }
    }

}



