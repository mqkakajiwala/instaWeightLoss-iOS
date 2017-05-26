//
//  HomeVC.swift
//  InstaWeightLoss
//
//  Created by Mustafa on 26/05/2017.
//  Copyright © 2017 Mustafa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Outlets n variables
    
    @IBOutlet var tableView: UITableView!
    let labelArray = ["EXERCISE", "DIET RECIPES", "BMI", "DO'S & DONT'S", "FACTS", "FAVORITES"]
    let imagesArray = [#imageLiteral(resourceName: "exercise_btn"), #imageLiteral(resourceName: "diet_recipes_btn"), #imageLiteral(resourceName: "bmi_calculator_btn"), #imageLiteral(resourceName: "do&dont_btn"), #imageLiteral(resourceName: "facts_btn"), #imageLiteral(resourceName: "favorites_btn")]
    
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }
    
 
    //MARK: Table View Data Source 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let categoryImages: UIImageView = cell.viewWithTag(1) as! UIImageView
        let categoryLabels: UILabel = cell.viewWithTag(2) as! UILabel
        
        categoryImages.image = imagesArray[indexPath.row]
        categoryLabels.text = labelArray[indexPath.row]
        
        
        return cell
    }
    
    //MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.size.height/6
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToDetail", sender: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }



}
