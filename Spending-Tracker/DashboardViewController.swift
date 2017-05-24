//
//  DashboardViewController.swift
//  Spending-Tracker
//
//  Created by Kaan Ozkan on 2017-04-14.
//  Copyright © 2017 Kaan Ozkan. All rights reserved.
//

import UIKit
import Charts

// Dashboard is the first screen user sees
class DashboardViewController: UIViewController {
	
	//@IBOutlet weak var pieChart: UIView!
	@IBOutlet weak var pieChart: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
		//self.view.addSubview(customView)
		//self.customView.addSubview(pieChart)

        // Do any additional setup after loading the view.
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
