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
    var selectedRegion : SMRegion?
    var selectedAttractions : [SMAttraction] = []
    var mapZoomUpdatedOnce = false
    
    
    
    
    @IBOutlet weak var Segment: NLSegmentControl!
    
    

    @IBOutlet var searchBarMap: UISearchBar!
    
    
    

    
    
    @IBAction func currentLocationActionBT(_ sender: UIButton) {
        
        //manager.startUpdatingLocation()
        let userLocation = mainMap.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!,2000 , 2000)
        mainMap.setRegion(region, animated: true)
        
    }
    
   
    
        
    @IBOutlet weak var mainMap: MKMapView!
    
    var zoomRect = MKMapRectNull;
    
    
    
    
    
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
            
            v!.image = UIImage(named:"mapPin")
            
            
        }
        else {
            v!.annotation = annotation
        }
        return v
    }
    

    
    
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            
            
            if let region = view.annotation as? SMRegion {
                print(region.regionName)
                
                
                let pinToZoomOn = view.annotation
                let span = MKCoordinateSpanMake(0.2, 0.2)
                let regionRect = MKCoordinateRegion(center: pinToZoomOn!.coordinate, span: span)
                mainMap.setRegion(regionRect, animated: true)
                
                
                selectedRegion = region
                
                drawAssignedPins()
                
            }else if let attraction = view.annotation as? SMAttraction {
                print(attraction.name)
            }
            
            
        }

    }

    
    func drawAssignedPins(){
        
      
      
            // display all regions
        if let region = selectedRegion {
            // I will remove all items from the map & then put this region's attractions
            mainMap.removeAnnotations(mainMap.annotations)
            
            let attractions = region.attractionList?.map { attractionAnno -> MKAnnotation in
                
                attractionAnno.setAnnotation()
                return attractionAnno
            }
            mainMap.addAnnotations(attractions ?? [])
            
    } else {
            mainMap.removeAnnotations(mainMap.annotations)
            let regions = SMRegionManager.shared.regionList.map { regionAnno -> MKAnnotation in
                regionAnno.setRegionAnnotation()
                return regionAnno
            }
            mainMap.addAnnotations(regions)
        }
}
    
    override func viewDidLoad() {
        
        searchBarMap.delegate = self
        
        //show user location
        mainMap.showsUserLocation = true

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        prepareSegmentView()

        
        drawAssignedPins()
        
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
                
                let span = MKCoordinateSpanMake(0.2, 0.2)
                let regionA = MKCoordinateRegion(center: anno.coordinate, span: span)
                
                self.mainMap.setRegion(regionA, animated: true)
                
                self.mainMap.selectAnnotation(anno, animated: true)
                
                
                
            }else{
                print(error?.localizedDescription ?? "error")
            }
            
            
        }
        
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Zoom Index  \(mapView.region.span.longitudeDelta)")
        
        if mapView.region.span.longitudeDelta > 2 {
            selectedRegion = nil
            drawAssignedPins()
        }else if (mapView.region.span.longitudeDelta < 4 && selectedRegion == nil){
            // I need to set the selected Region to the nearest region to the map center
           
            
            var minimum = Int.max
            
            
            
            for region in SMRegionManager.shared.regionList// over all regions
            {
                let mapCenter = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
                let regionCenter = CLLocation(latitude: region.latitude, longitude: region.longitude)
                
                let distanceInMeters = mapCenter.distance(from: regionCenter) // result is in meters
                if (Int(distanceInMeters) < minimum) {
                    minimum = Int(distanceInMeters)
                    selectedRegion = region
                }
            
            }
            drawAssignedPins()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





}
