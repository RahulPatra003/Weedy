//
//  DetailViewController.swift
//  Weedy
//
//  Created by MAC on 15/08/20.
//  Copyright © 2020 Salace. All rights reserved.
//

import UIKit
import iCarousel
import IBAnimatable

class DetailViewController: UIViewController {

    @IBOutlet weak var productView: iCarousel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var upperView: AnimatableView!
    
    var pageController: UIPageViewController!
    var imageArray = [UIImage(named: "weed2"), UIImage(named: "weed")]
    let cartButton : UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width:30, height:30))
        button.tintColor = .white
        button.setImage(UIImage(named: "cart"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.isUserInteractionEnabled = false
        pageControl.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        pageControl.currentPage = 0
        pageControl.numberOfPages = imageArray.count
        
        productView.isPagingEnabled = true
        productView.delegate = self
        productView.dataSource = self
        productView.type = .linear
        
        upperView.cornerRadius = 50
        upperView.cornerSides = [.bottomLeft, .bottomRight]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    func setNavigationBar() {
        
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")

        self.navigationController?.navigationBar.barTintColor = UIColor(named: "PColor")
        self.navigationController?.navigationBar.tintColor = .darkGray
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Sample Weed"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont(name: "Rockwell-Bold" , size: 40)! ]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont(name: "Rockwell-Bold" , size: 22)! ]

        let cartView = UIView(frame: CGRect(x:0, y:0, width:20, height:30))
        cartView.addSubview(cartButton)
        
        let cartBB = UIBarButtonItem(customView: cartView)
        
        self.navigationItem.rightBarButtonItems = [cartBB]
    }

}

extension DetailViewController : iCarouselDelegate, iCarouselDataSource {
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return imageArray.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let viewOne = Bundle.main.loadNibNamed("ProductImageXib", owner: self, options: nil)?.first as! ProductImageView
        viewOne.frame = productView.frame
        viewOne.proImage.image = imageArray[index]
        return viewOne
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
        
    }
}
