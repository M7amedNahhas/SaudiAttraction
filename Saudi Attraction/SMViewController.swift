//
//  ViewController.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import CoreLocation

class SMViewController: UIViewController,CLLocationManagerDelegate , UISearchBarDelegate , MKMapViewDelegate{
   
    let manager = CLLocationManager()
    
    
    
    @IBOutlet weak var Segment: NLSegmentControl!
    
    

    @IBOutlet var searchBarMap: UISearchBar!
    
    
    
    
    
    
    @IBAction func currentLocationActionBT(_ sender: UIButton) {
        
        //manager.startUpdatingLocation()
        let userLocation = mainMap.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!,2000 , 2000)
        mainMap.setRegion(region, animated: true)
        
    }
    
   
    
        
    @IBOutlet weak var mainMap: MKMapView!
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mainMap.setRegion(region, animated: true)
        
        
        self.mainMap.showsUserLocation = true
        
        
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {return nil}
        
        
        
        let reuseIdentifier = "pin"
        
        var v = mainMap.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if v == nil {
            v = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            
            v!.canShowCallout = true
            let calloutButton = UIButton(type: .detailDisclosure)
            v!.rightCalloutAccessoryView = calloutButton
            v!.sizeToFit()
            
            v!.image = UIImage(named:"map_pointer_small")
            
        }
        else {
            v!.annotation = annotation
        }
        return v
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            // هنا العملية تصير حقت الزر تغيرها على حسب احتياجك
            
        }
    }

    
    override func viewDidLoad() {
        
        searchBarMap.delegate = self
        
        //show user location
        mainMap.showsUserLocation = true
        
        
        
        
        
        
        
        let regions = SMRegionManager.shared.regionList.map { region -> MKAnnotation in
            region.setRegionAnnotation()
            return region
        }
        
        let attractions = SMRegionManager.shared.regionList[1].attractionList!.map { attraction  -> MKAnnotation in
            attraction.setAnnotation()
            return attraction
        }
        
        mainMap.addAnnotations(attractions)
        
        mainMap.addAnnotations(regions)
        
        

       /* let attractionAnnotations = SMRegionManager.shared.regionList[0].attractionList!.map { attraction  -> MKAnnotation in
           
            let annotation = MKPointAnnotation()
            annotation.title = attraction.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)
            return annotation
           
        } */

        
        /* let annotations = SMRegionManager.shared.regionList[0].attractionList!.map { attraction  -> MKAnnotation in
            mainMap.addAnnotation(attraction)
            

            return attraction
        }*/

           
        
        

   
        
        
        
        
        
        
        /*
 
         let annotations = locations.map { location -> MKAnnotation in
         let annotation = MKPointAnnotation()
         annotation.title = location.title
         annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
         return annotation
         }
         mapView.addAnnotations(annotations)
         
         */
            
        
        
       
      
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        prepareSegmentView()
        
        
        }
   
    
    func prepareSegmentView(){
    
        //segmented
        let item11 = Category(title: "All", image: "All", selectedImage: "All")
        let item12 = Category(title: "Mall", image: "Mall", selectedImage: "Mall")
        let item13 = Category(title: "Religious", image: "Religious", selectedImage: "Religious")
        let item14 = Category(title: "Park", image: "Park", selectedImage: "Park")
        let item15 = Category(title: "Historical", image: "Historical", selectedImage: "Historical")
        
        let imageTextSegment = NLSegmentControl(segments: [item11, item12, item13, item14, item15])
        
        self.Segment.addSubview(imageTextSegment)
        imageTextSegment.selectionIndicatorColor = UIColor(red: 52/255.0, green: 181/255.0, blue: 229/255.0, alpha: 1.0)
        imageTextSegment.segmentWidthStyle = .dynamic
        imageTextSegment.segmentEdgeInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 15)
        imageTextSegment.imagePosition = .left
        //        imageTextSegment.imageTitleSpace = 10
        //        imageTextSegment.enableVerticalDivider = true
        imageTextSegment.selectionIndicatorStyle = .textWidthStripe
        imageTextSegment.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.black]
        imageTextSegment.selectedTitleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17.0), NSForegroundColorAttributeName: UIColor(red: 52/255.0, green: 181/255.0, blue: 229/255.0, alpha: 1.0)]
        
        
        
        imageTextSegment.indexChangedHandler = {
            (index) in
            print("Ramadan changed: \(index)")
        }
        
        imageTextSegment.nl_marginTop(toView: Segment, margin:-65)
        imageTextSegment.nl_equalLeft(toView: self.Segment, offset: 0)
        imageTextSegment.nl_equalRight(toView: self.Segment, offset: 0)
        imageTextSegment.nl_heightIs(60)
        imageTextSegment.reloadSegments()
    }
    
    //searchBar

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.searchBarMap.text!) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                
                let placemark = placemarks?.first
                
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = self.searchBarMap.text!
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                let regionA = MKCoordinateRegion(center: anno.coordinate, span: span)
                
                self.mainMap.setRegion(regionA, animated: true)
                
                self.mainMap.selectAnnotation(anno, animated: true)
                
                
                
            }else{
                print(error?.localizedDescription ?? "error")
            }
            
            
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

