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
    var selectedAttraction : SMAttraction?
    var typesArray = [Category]()
    var selectedSegmentType = "الكل"
    
    
    
    var ref = DatabaseReference.init()
    
    
    @IBOutlet weak var Segment: NLSegmentControl!
    
    
    

    @IBOutlet var searchBarMap: UISearchBar!
    
    
    @IBAction func currentLocationActionBT(_ sender: UIButton) {
        
        
        
        //manager.startUpdatingLocation()
        let userLocation = mainMap.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!,2000 , 2000)
        mainMap.setRegion(region, animated: true)
        
        
        
    }
    
   
    @IBAction func SearchBt(_ sender: UIButton) {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
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
        
        
        if let _ = annotation as? SMRegion{
            
            let reuseIdentifier = "pin"
            
            var v = mainMap.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKRegionView
            if v == nil {

                v = MKRegionView(annotation: annotation, reuseIdentifier: reuseIdentifier)

                v!.image = UIImage(named:"mapPin")
                v!.setSelected(true, animated: true)
                
                
                
                
                
                
            }
            else {
                v!.annotation = annotation
                v!.setSelected(true, animated: true)
                
                
            }
            return v
        
        }else{
        
            let reuseIdentifier = "pinAttraction"
            
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
        
        
    }
    

    
    
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            
            
            if let region = view.annotation as? SMRegion {
                print(region.regionName)
                
                
                let pinToZoomOn = view.annotation
                let span = MKCoordinateSpanMake(0.2, 0.2)
                let regionRect = MKCoordinateRegion(center: pinToZoomOn!.coordinate, span: span)
                mainMap.setRegion(regionRect, animated: true)
                
                
                publicSelectedRegion = region
                
                loadAttractionBasedOnFilters()
                
            }else if let attraction = view.annotation as? SMAttraction {
                print(attraction.name)
                self.selectedAttraction = attraction
              // self.performSegue(withIdentifier: "segueToAttractionDetail", sender: nil)
                
                
                let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
                self.addChildViewController(detailsViewController)
                
                detailsViewController.attraction = attraction
                self.view.addSubview(detailsViewController.view)
                
                detailsViewController.didMove(toParentViewController: self)
                
                           
                

            }
            
            
        }

    }

    
    
    func  loadAttractionBasedOnFilters()
    {
        SMRegionManager.shared.loadAttraction(regionID: publicSelectedRegion!.id, TypeID: selectedSegmentType){ [unowned self] attractionListItems in
            self.publicSelectedRegion?.attractionList?.removeAll()
            self.publicSelectedRegion?.attractionList = attractionListItems
            self.drawAssignedPins()
        }
    }
    // animation 
    
    func beginAnimation () {
        // 1st transformation
        Segment.isHidden = false
        self.Segment.transform = CGAffineTransform(translationX: 0, y: -100)
        
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            // 2nd transformation
            self.Segment.transform = CGAffineTransform(translationX: 0, y: 25)
        }, completion: { completion in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                // 3rd transformation
                self.Segment.transform = CGAffineTransform(translationX: 0, y:0)
            }, completion: nil)
        })
    }
    func endAnimation () {
        // 1st transformation
        self.Segment.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            // 2nd transformation
            self.Segment.transform = CGAffineTransform(translationX: 0, y: 25)
        }, completion: { completion in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                // 3rd transformation
                self.Segment.transform = CGAffineTransform(translationX: 0, y: -100)
                self.Segment.isHidden = true
            }, completion: nil)
        })

    }
    

    


 // animation when the region selected
    
    var publicSelectedRegion: SMRegion? {
        set {
            if let region = newValue {
                // begion animation
                beginAnimation()
                print( "Start Animation as \(region.regionName) is selected")
            }else{
                endAnimation()
                print( "End Animation")
            }
            selectedRegion = newValue
        }
        get { return selectedRegion }
    }
    
    
    func drawAssignedPins(){
        
        
        
      
            // display all regions
        if let region = publicSelectedRegion {
            
            //beginAnimation()
            // I will remove all items from the map & then put this region's attractions
            mainMap.removeAnnotations(mainMap.annotations)
            
            let attractions = region.attractionList?.map { attractionAnno -> MKAnnotation in
                
                attractionAnno.setAnnotation()
                
                
                return attractionAnno
                
            }
            mainMap.addAnnotations(attractions ?? [])
            
    } else {
           // endAnimation()
            mainMap.removeAnnotations(mainMap.annotations)
            let regions = SMRegionManager.shared.regionList.map { regionAnno -> MKAnnotation in
                regionAnno.setRegionAnnotation()
                return regionAnno
            }
            mainMap.addAnnotations(regions)
        }
}
    
    override func viewDidLoad() {
       

        
        self.Segment.transform = CGAffineTransform(translationX: 0, y: -100)
    

        
       // searchBarMap.delegate = self
        
       Segment.isHidden = true
        //show user location
        mainMap.showsUserLocation = true

        
        //database 
        self.ref = Database.database().reference()
        
        

        
        SMRegionManager.shared.loedCity(){ [unowned self] regionListItem in
            self.drawAssignedPins()
        }
        

      
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        preparePrepareSegmentView()
        
        publicSelectedRegion = nil

        
        drawAssignedPins()
        
        }
    
    
      
    func preparePrepareSegmentView() {
        
      SMRegionManager.shared.LoadTypes{ [unowned self] (types) in
            self.typesArray.append(Category(title: "الكل", image: " ", selectedImage: " "))
            for i in(0..<types.count){
                self.typesArray.append(Category(title: types[i].name, image: " ", selectedImage: " "))
            }
            
            
            prepareSegmentView()
        }
        
        func prepareSegmentView(){
            
            
            
            let imageTextSegment = NLSegmentControl(segments: typesArray)
            //segmented
            self.Segment.addSubview(imageTextSegment)
            imageTextSegment.selectionIndicatorColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            imageTextSegment.segmentWidthStyle = .dynamic
            imageTextSegment.segmentEdgeInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 15)
            imageTextSegment.imagePosition = .left
            //        imageTextSegment.imageTitleSpace = 10
            //        imageTextSegment.enableVerticalDivider = true
            imageTextSegment.selectionIndicatorStyle = .textWidthStripe
            imageTextSegment.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.black]
            imageTextSegment.selectedTitleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17.0), NSForegroundColorAttributeName: UIColor(red: 140/255.0, green: 140/255.0, blue: 140/255.0, alpha: 1.0)]
            
            
            imageTextSegment.indexChangedHandler = {
                (index) in
                print("Ramadan changed: \(index)")
                self.selectedSegmentType = self.typesArray[index].categoryTitle ?? "All"
                if let region = self.publicSelectedRegion{
                    self.loadAttractionBasedOnFilters()
                }else{
                    print ("You have to choose a regison first, or at least get the nearst region to my location")
                }
                
            }
            
            imageTextSegment.nl_marginTop(toView: Segment, margin:-60)
            imageTextSegment.nl_equalLeft(toView: self.Segment, offset: 0)
            imageTextSegment.nl_equalRight(toView: self.Segment, offset: 0)
            imageTextSegment.nl_heightIs(60)
            imageTextSegment.reloadSegments()
        }
    }
   

    
    //searchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Create the search request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
               
            }
            else
            {
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpanMake(0.1,0.1)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.mainMap.setRegion(region, animated: true)
            }
            
        }
    }

//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//        
//        
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(self.searchBarMap.text!) { (placemarks:[CLPlacemark]?, error:Error?) in
//            if error == nil {
//                
//                let placemark = placemarks?.first
//                
//                let anno = MKPointAnnotation()
//                anno.coordinate = (placemark?.location?.coordinate)!
//                anno.title = self.searchBarMap.text!
//                
//                let span = MKCoordinateSpanMake(0.2, 0.2)
//                let regionA = MKCoordinateRegion(center: anno.coordinate, span: span)
//                
//                self.mainMap.setRegion(regionA, animated: true)
//                
//                self.mainMap.selectAnnotation(anno, animated: true)
//                
//                searchBar.resignFirstResponder()
//                
//                
//            }else{
//                print(error?.localizedDescription ?? "error")
//                
//            }
//            
//            
//        }
//        
//        
//    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Zoom Index  \(mapView.region.span.longitudeDelta)")
        
        if mapView.region.span.longitudeDelta > 1.7 {
            

            
            publicSelectedRegion = nil
            drawAssignedPins()
        }else if (mapView.region.span.longitudeDelta < 1.7 && publicSelectedRegion == nil){
            // I need to set the selected Region to the nearest region to the map center
           
            var minimum = Int.max
         
            for region in SMRegionManager.shared.regionList// over all regions
            {
                let mapCenter = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
                let regionCenter = CLLocation(latitude: region.latitude, longitude: region.longitude)
                
                let distanceInMeters = mapCenter.distance(from: regionCenter) // result is in meters
                if (Int(distanceInMeters) < minimum) {
                    minimum = Int(distanceInMeters)
                    publicSelectedRegion = region
                }
            
            }
         
            drawAssignedPins()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let region = view.annotation as? SMRegion{
            print(region.regionName)
            
            
            let span = MKCoordinateSpanMake(0.2, 0.2)
            let regionRect = MKCoordinateRegion(center: region.coordinate, span: span)
            mainMap.setRegion(regionRect, animated: true)
            
            
            publicSelectedRegion = region
            
            loadAttractionBasedOnFilters()

        }
    }

}
