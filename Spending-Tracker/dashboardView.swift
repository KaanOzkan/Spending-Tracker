//
//  dashboardView.swift
//  Spending-Tracker
//
//  Created by Kaan Ozkan on 2017-04-15.
//  Copyright © 2017 Kaan Ozkan. All rights reserved.
//

import UIKit
import Charts

class dashboardView: UIView {

	@IBOutlet weak var pieChart: PieChartView!

	let dataText = ["You spent", "Avaliable"]
	let values = [350.0, 150.0] // to be removed, has to be calculated
	let colors = [UIColor.red.withAlphaComponent(0.7), UIColor.green.withAlphaComponent(0.8)]


	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupPieChart()
	}

	func setupPieChart () {
		self.loadFromNibNamed("pieChart")
		self.fillChart()
	}

	func fillChart() {
		var dataEntries : [ChartDataEntry] = []

		// populate entries from data
		for (index,value) in self.values.enumerated() {
			let dataEntry = PieChartDataEntry()
			dataEntry.y = value
			dataEntry.label = self.dataText[index]
			dataEntries.append(dataEntry)
		}
		let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "    Monthly Spending")
		pieChartDataSet.colors = colors
		let pieChartData = PieChartData(dataSet: pieChartDataSet)
		pieChart.data = pieChartData
		pieChart.noDataText = "No avalaible"
		pieChart.chartDescription?.text = ""
		pieChart.drawEntryLabelsEnabled = false
		pieChart.isUserInteractionEnabled = true
	}

	func calculateSpending() {
		// TODO
	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


	/**
		Loads Nib

		- Parameters:
			- nibName: name of the nib
			- bundle: default value is nil
	*/

	func loadFromNibNamed(_ nibName: String, bundle: Bundle? = nil) {
		let nib = UINib(nibName: nibName, bundle: bundle)
		let nibView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
		nibView.frame = CGRect(x: 10, y: 100, width: 350, height: 400)
		self.addSubview(nibView)
	}
}

