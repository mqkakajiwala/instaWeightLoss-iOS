//
//  HomeDetailVC.swift
//  InstaWeightLoss
//
//  Created by Mustafa on 26/05/2017.
//  Copyright © 2017 Mustafa. All rights reserved.
//

import UIKit

class HomeDetailVC: UIViewController, iCarouselDataSource, iCarouselDelegate {

    //MARK: Outlets n variables
    
    @IBOutlet var carouselView: iCarousel!
    var items: [Int] = []
    
    //MARK: View LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0 ... 99 {
            items.append(i)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carouselView.type = .linear
    }
    
    //MARK: iCarousel Data Source
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
           
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            itemView.image = UIImage(named: "home_main_img")
            itemView.contentMode = .center
            
    
        }
        
  
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    
    //MARK: Back bar button method
    @IBAction func backBarButton(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
