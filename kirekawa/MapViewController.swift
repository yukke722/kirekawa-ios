//
//  MapViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 以下を追加 ///
        let lat = 10.781164
        let lon = 106.704814
        let coordinate = CLLocationCoordinate2DMake(lat, lon)
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(region, animated:true)
        
        let annotation = MKPointAnnotation()
        let pinLat = 10.780596
        let pinLon = 106.704815
        annotation.coordinate = CLLocationCoordinate2DMake(pinLat, pinLon)
        annotation.title = "JUMBO"
        annotation.subtitle = "ジャンボ"
        self.mapView.addAnnotation(annotation)
        /////////////////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
