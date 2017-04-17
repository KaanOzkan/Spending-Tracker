//
//  ViewController.swift
//  Spending-Tracker
//
//  Created by Kaan Ozkan on 2017-04-14.
//  Copyright © 2017 Kaan Ozkan. All rights reserved.
//

import UIKit

// This CustomViewVController holds a container view for the 3 views. Those views are handled by their own ViewContollers
// Any additional customizations to the views should be done within their ViewControllers not this CustomViewController

class CustomViewController: UIViewController, UIScrollViewDelegate {
	@IBOutlet weak var scrollView: UIScrollView!
	private var viewControllers = [UIViewController]()
	private var pageControl = UIPageControl(frame: .zero)

	// In the future for additions to viewDidLoad() utilize functions in order not to have a crowded method
	override func viewDidLoad() {
		super.viewDidLoad()
		scrollView.delegate = self

		let bounds = UIScreen.main.bounds
		let width = bounds.size.width
		let height = bounds.size.height
		let storyboard = UIStoryboard(name: "Main", bundle: nil)

		// Define as implicit unwrapped since they should always be instantiated
		let dashboardVC = storyboard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
		let leftVC = storyboard.instantiateViewController(withIdentifier: "left") as! LeftViewController
		let rightVC = storyboard.instantiateViewController(withIdentifier: "right") as! RightViewController

		viewControllers = [leftVC, dashboardVC, rightVC]

		// Do view setup here
		setupPageControl(pageControl)
		setupScrollView(scrollView, width: width, height: height)
		setupViewControllers(viewControllers, width: width, height: height)


		// Do any additional setup after loading the view, typically from a nib.
	}

	func setupScrollView(_ scrollView: UIScrollView, width: CGFloat, height: CGFloat) {
		// 3 views therefore * 3
		scrollView.contentSize = CGSize(width: width * 3, height: 1.0)
		scrollView.isPagingEnabled = true
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.contentOffset = CGPoint(x: width, y: 0)
	}


	func setupPageControl(_ pageControl: UIPageControl) {
		pageControl.numberOfPages = self.viewControllers.count
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		pageControl.currentPageIndicatorTintColor = UIColor.orange
		pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)

		self.view.insertSubview(pageControl, at: 0)
		self.view.bringSubview(toFront: pageControl)
		self.view.addConstraints(configurePageControlConstraints(pageControl))

	}

	func configurePageControlConstraints(_ pageControl: UIPageControl) -> ([NSLayoutConstraint])  {
		let leading = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
		let trailing = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
		let bottom = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)

		return [leading,trailing,bottom]
	}

	func setupViewControllers(_ viewControllers: [UIViewController], width: CGFloat, height: CGFloat) {
		// Numerical ID of the viewController (1,2,3)
		var viewControllerID = 0
		//  Start of the new view
		var originX: CGFloat

		for viewController in viewControllers {
			// All the VCs will be children of this CustomVC
			self.addChildViewController(viewController)
			originX = CGFloat(viewControllerID) * width
			viewController.view.frame = CGRect(x: originX, y: 0, width: width, height: height)
			scrollView.addSubview(viewController.view)
			viewController.didMove(toParentViewController: self)
			viewControllerID += 1
		}
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		// Calculate which page we are on and update it
		let page: Int = Int(scrollView.contentOffset.x / scrollView.frame.width)
		self.pageControl.currentPage = page
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

