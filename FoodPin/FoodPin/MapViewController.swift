//
//  MapViewController.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 10/03/16.
//  Copyright © 2016 Inspiring Learning. All rights reserved.
//

import MapKit
import UIKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView:MKMapView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location) { placemarks, error -> Void in
            if error != nil{
                print(error)
                return
            }
            
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        let identifier = "MyPin"
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        
        //Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.pinTintColor = UIColor.orangeColor()
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView (frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(data: restaurant.image!)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        return annotationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
