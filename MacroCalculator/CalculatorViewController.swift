//
//  CalculatorViewController.swift
//  MacroCalculator
//
//  Created by Tyler Clonts on 3/13/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: - Outlets
    var gender = UITextField()
    var bodyWeight = UITextField()
    var leanBodyMass = UITextField()
    var bodyFatPercentage = UITextField()
    var goalWeight = UITextField()
    var activityLevelButton = dropDownButton()
    var proteinLabel = UILabel()
    var carbohydrateLabel = UILabel()
    var fatLabel = UILabel()
    var calculateButton = UIButton()
    
    // MARK: - Actions
    @objc func calculateButtonTapped() {
        //Call calculate function we create else where
    }
    
    // Properties
    var bodyWeightInt: Double? = nil
    var LBM: Double? = nil
    var bodyFatPerc: Double? = nil
    var goalBWeight: Double? = nil
    
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextFields()
        
        // labels text
        proteinLabel.text = ""
        carbohydrateLabel.text = ""
        fatLabel.text = ""
        
    }
//TEXTFIELDS
    func setupTextFields() {
        // SetColors
        gender.backgroundColor = .white
        bodyWeight.backgroundColor = .white
        leanBodyMass.backgroundColor = .white
        bodyFatPercentage.backgroundColor = .white
        goalWeight.backgroundColor = .white
    }
    
    
    func setupTextFieldConstraints() {
        
    }
//LABELS
    func setupLabels() {
        // Set Colors
        proteinLabel.backgroundColor = .white
        carbohydrateLabel.backgroundColor = .white
        fatLabel.backgroundColor = .white
    }
    
    func setupLabelConstraints() {
        
    }
 
//BUTTONS
    func setupButton() {
        
        // ActivityLevelButton Set up
            //Colors and UI
        activityLevelButton = dropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        activityLevelButton.setTitle("Activity Level", for: .normal)
        activityLevelButton.setTitleColor(.black, for: .normal)
        activityLevelButton.layer.borderColor = UIColor.black.cgColor
        activityLevelButton.layer.borderWidth = 1
        
        // CalculateButton Set Up
            // Colors and UI
        calculateButton.backgroundColor = .white
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.layer.borderColor = UIColor.black.cgColor
        calculateButton.layer.borderWidth = 1
            // Add Target
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        
        
        // Adds info to my tableview drop down
        activityLevelButton.dropView.dropDownOptions = ["11", "12", "13", "14"]
        
        // Add the buttons as subviews of the ViewControllers view
        
        view.addSubview(activityLevelButton)
        view.addSubview(calculateButton)
        
    }
    
    func setupButtonConstraints() {
        activityLevelButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Height and Width
        
        
        // This places the activity level button in the middle of the screen and sets width and height
        activityLevelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityLevelButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        activityLevelButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        activityLevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // 1.) Add subviews
    
    
        // SetColors
        // Add targets
        // Add target for exit
        // Add the buttons as subviews of the ViewControllers view
    // 2.) Add button constraints
    // 3.) Add targets(Actions for button)
    // 4.) Add animation for button

    
}

// Drop Down Picker Functions

class dropDownButton: UIButton {
    
    // properties
    var dropView = dropDownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: dropView)
        
    }
    
    override func didMoveToSuperview() {
        
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: dropView)
        
        //Table view constraints.( This is the tableview constrained to the activityLevel Button)
        dropView.topAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Drop down view
class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
        
        var dropDownOptions = [String]()
    
        var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        // The
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dropDownOptions.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropDownOptions[indexPath.row])
    }
        
}

