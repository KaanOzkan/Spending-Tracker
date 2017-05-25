//
//  LeftViewController.swift
//  Spending-Tracker
//
//  Created by Kaan Ozkan on 2017-04-14.
//  Copyright © 2017 Kaan Ozkan. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker
import GoogleMaps

class LeftViewController: UIViewController {
	var placesClient : GMSPlacesClient!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		placesClient = GMSPlacesClient.shared()
		self.view.backgroundColor = UIColor.green
		//self.view.translatesAutoresizingMaskIntoConstraints = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func searchPlace(_ sender: UIButton) {
		//get current place
//		placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
//			if let error = error {
//				print("Error while picking place")
//				return
//			}
//
//			self.nameLabel.text = "No place rn sorry"
//			self.addressLabel.text = ""
//
//			if let placeLikelihoodList = placeLikelihoodList {
//				let place = placeLikelihoodList.likelihoods.first?.place
//				if let place = place {
//					self.nameLabel.text = place.name
//					self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ").joined(separator: "\n")
//					print("getting address")
//				}
//			}
//			
//		})
		// For now just use Waterloo campus location
		let center = CLLocationCoordinate2D(latitude: 43.469757, longitude: -80.5409518)
		let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,longitude: center.longitude + 0.001)
		let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
		let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
		let config = GMSPlacePickerConfig(viewport: viewport)
		let placePicker = GMSPlacePicker(config: config)

		placePicker.pickPlace(callback: {(place, error) -> Void in
			if let error = error {
				print("Error while picking a place")
				return
			}
			if let place = place {
				self.nameLabel.text = place.name
				self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ").joined(separator: "\n")
			}
		})
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
