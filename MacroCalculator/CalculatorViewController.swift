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
    var genderTextField = UITextField()
    var bodyWeightTextField = UITextField()
    var leanBodyMassTextField = UITextField()
    var bodyFatPercentageTextField = UITextField()
    var goalWeightTextField = UITextField()
    var activityLevelButton = dropDownButton()
    var titleLabel = UILabel()
    var activityLevelTitleLabel = UILabel()
    var genderLabel = UILabel()
    var bodyWeightLabel = UILabel()
    var leanBodyMassLabel = UILabel()
    var bodyFatPercentageLabel = UILabel()
    var goalWeightLabel = UILabel()
    var proteinBoxLabel = UILabel()
    var carbohydrateBoxLabel = UILabel()
    var fatBoxLabel = UILabel()
    var proteinTitleLabel = UILabel()
    var carbohydrateTitleLabel = UILabel()
    var fatTitleLabel = UILabel()
    var calculateButton = UIButton()
    var clearButton = UIButton()
    
    
    // MARK: - Actions
    @objc func calculateButtonTapped() {
        //Call calculate function we create else where
        proteinCalculator()
        carbCalculator()
        fatCalculator()
        
    }
    
    @objc func clearButtonTapped() {
      
        
    }
    
    // Properties
    var bodyWeightInt: Double? = nil
    var LBM: Double? = nil
    var bodyFatPerc: Double? = nil
    var goalBWeight: Double? = nil
    
//    func calculateMacros() {
//        carbsInt = Int(self.carbsField.text!)
//        proteinInt = Int(self.proteinField.text!)
//        fatsInt = Int(self.fatField.text!)
//
//        total = (carbsInt! * 4) + (proteinInt! * 4) + (fatsInt! * 9)
//
//        caloriesLabel.text = "\(total) calories"
//    }
    
    func calorieCalculator() {
        let currentBW = Int(bodyWeightTextField.text!)
        let activityLevel = 11
        let maitenanceCal = (currentBW! * activityLevel)
        let newMC = (maitenanceCal - 250)
        
    }
    
    func proteinCalculator() {
        guard let proteinInG = Int(leanBodyMassTextField.text!) else { return }
        proteinBoxLabel.text = "\(proteinInG)"
        print(proteinInG)
    }
    
    func carbCalculator() {
        
        let carbsInG = (Int(Double(leanBodyMassTextField.text!)! * (1.3)))
        carbohydrateBoxLabel.text = "\(carbsInG)"
       
    }
    
    func fatCalculator() {
        let proteinInG = Int(leanBodyMassTextField.text!)
        let proteinCals = (proteinInG! * 4)
        let carbsInG = (Int(Double(leanBodyMassTextField.text!)! * (1.3)))
        let carbCals = (carbsInG * 4)
        let maitenanceCal = (Int(bodyWeightTextField.text!)! * 11)
        let newMC = (maitenanceCal - 250)
        let fatInG = (newMC - (proteinCals + carbCals)) / Int(9.0)
        fatBoxLabel.text = "\(fatInG)"
    }

    
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextFields()
        setupLabels()
        setupButtonConstraints()
        setupTextFieldConstraints()
        setupLabelConstraints()
    }
//TEXTFIELDS
    func setupTextFields() {
        // Set background color and text color.
        genderTextField.backgroundColor = .white
        genderTextField.textColor = .black
        genderTextField.layer.borderColor = UIColor.black.cgColor
        genderTextField.layer.borderWidth = 1
        bodyWeightTextField.backgroundColor = .white
        bodyWeightTextField.textColor = .black
        bodyWeightTextField.layer.borderColor = UIColor.black.cgColor
        bodyWeightTextField.layer.borderWidth = 1
        leanBodyMassTextField.backgroundColor = .white
        leanBodyMassTextField.textColor = .black
        leanBodyMassTextField.layer.borderColor = UIColor.black.cgColor
        leanBodyMassTextField.layer.borderWidth = 1
        bodyFatPercentageTextField.backgroundColor = .white
        bodyFatPercentageTextField.textColor = .black
        bodyFatPercentageTextField.layer.borderColor = UIColor.black.cgColor
        bodyFatPercentageTextField.layer.borderWidth = 1
        goalWeightTextField.backgroundColor = .white
        goalWeightTextField.textColor = .black
        goalWeightTextField.layer.borderColor = UIColor.black.cgColor
        goalWeightTextField.layer.borderWidth = 1
        
    }
    
    
    func setupTextFieldConstraints() {
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyWeightTextField.translatesAutoresizingMaskIntoConstraints = false
        leanBodyMassTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyFatPercentageTextField.translatesAutoresizingMaskIntoConstraints = false
        goalWeightTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add textfields as subviews of the View Controllers view
        view.addSubview(genderTextField)
        view.addSubview(bodyWeightTextField)
        view.addSubview(leanBodyMassTextField)
        view.addSubview(bodyFatPercentageTextField)
        view.addSubview(goalWeightTextField)
        
        // genderTextField Constraints
        let genderLeading = NSLayoutConstraint(item: genderTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let genderTrailing = NSLayoutConstraint(item: genderTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let genderBottom = NSLayoutConstraint(item: genderTextField, attribute: .bottom, relatedBy: .equal, toItem: bodyWeightTextField, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([genderLeading, genderTrailing, genderBottom])
        // bodyWeightTextField Constrains
        let bodyWeightLeading = NSLayoutConstraint(item: bodyWeightTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let bodyWeightTrailing = NSLayoutConstraint(item: bodyWeightTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let bodyWeightBottom = NSLayoutConstraint(item: bodyWeightTextField, attribute: .bottom, relatedBy: .equal, toItem: leanBodyMassTextField, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([bodyWeightLeading, bodyWeightTrailing, bodyWeightBottom])
        
        // leanBodyMassTextField Constraints
        let leanBodyLeading = NSLayoutConstraint(item: leanBodyMassTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let leanBodyTrailing = NSLayoutConstraint(item: leanBodyMassTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let leanBodyBottom = NSLayoutConstraint(item: leanBodyMassTextField, attribute: .bottom, relatedBy: .equal, toItem: bodyFatPercentageTextField, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([leanBodyLeading, leanBodyTrailing, leanBodyBottom])
        
        // bodyFatPercentageTextField Constraints
        let bodyFatLeading = NSLayoutConstraint(item: bodyFatPercentageTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let bodyFatTrailing = NSLayoutConstraint(item: bodyFatPercentageTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let bodyFatBottom = NSLayoutConstraint(item: bodyFatPercentageTextField, attribute: .bottom, relatedBy: .equal, toItem: goalWeightTextField, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([bodyFatLeading, bodyFatTrailing, bodyFatBottom])
       
        // Goal Weight Text Field Constraints
        let goalLeading = NSLayoutConstraint(item: goalWeightTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let goalTrailing = NSLayoutConstraint(item: goalWeightTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let goalBottom = NSLayoutConstraint(item: goalWeightTextField, attribute: .bottom, relatedBy: .equal, toItem: activityLevelButton, attribute: .top, multiplier: 1, constant: -35)

        view.addConstraints([goalLeading, goalTrailing, goalBottom])
        

    }
    
//LABELS
    func setupLabels() {
        // Set backgroundColor, text color, and text
        proteinBoxLabel.backgroundColor = .white
        proteinBoxLabel.textColor = .black
        proteinBoxLabel.text = "0"
        proteinBoxLabel.font = UIFont.boldSystemFont(ofSize: 20)
        carbohydrateBoxLabel.backgroundColor = .white
        carbohydrateBoxLabel.textColor = .black
        carbohydrateBoxLabel.text = "0"
        carbohydrateBoxLabel.font = UIFont.boldSystemFont(ofSize: 20)
        fatBoxLabel.backgroundColor = .white
        fatBoxLabel.textColor = .black
        fatBoxLabel.text = "0"
        fatBoxLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.backgroundColor = .white
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "MacroCalculator"
        genderLabel.backgroundColor = .white
        genderLabel.textColor = .black
        genderLabel.text = "Gender:"
        bodyWeightLabel.backgroundColor = .white
        bodyWeightLabel.textColor = .black
        bodyWeightLabel.text = "BodyWeight:"
        leanBodyMassLabel.backgroundColor = .white
        leanBodyMassLabel.textColor = .black
        leanBodyMassLabel.text = "Lean Body Mass:"
        bodyFatPercentageLabel.backgroundColor = .white
        bodyFatPercentageLabel.textColor = .black
        bodyFatPercentageLabel.text = "Body Fat Percentage:"
        goalWeightLabel.backgroundColor = .white
        goalWeightLabel.textColor = .black
        goalWeightLabel.text = "Goal Weight:"
        proteinTitleLabel.backgroundColor = .white
        proteinTitleLabel.textColor = .black
        proteinTitleLabel.text = "Protein"
        carbohydrateTitleLabel.backgroundColor = .white
        carbohydrateTitleLabel.textColor = .black
        carbohydrateTitleLabel.text = "Carbs"
        fatTitleLabel.backgroundColor = .white
        fatTitleLabel.textColor = .black
        fatTitleLabel.text = "Fat"
        activityLevelTitleLabel.backgroundColor = .white
        activityLevelTitleLabel.textColor = .black
        activityLevelTitleLabel.text = "Activity Level:"
        
    }
    
    func setupLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLevelTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        leanBodyMassLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyFatPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        goalWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        proteinBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        carbohydrateBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        fatBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        proteinTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        carbohydrateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fatTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Add Labels as subviews of the View Controllers view
        view.addSubview(titleLabel)
        view.addSubview(genderLabel)
        view.addSubview(bodyWeightLabel)
        view.addSubview(leanBodyMassLabel)
        view.addSubview(bodyFatPercentageLabel)
        view.addSubview(goalWeightLabel)
        view.addSubview(activityLevelTitleLabel)
        view.addSubview(proteinBoxLabel)
        view.addSubview(carbohydrateBoxLabel)
        view.addSubview(fatBoxLabel)
        view.addSubview(proteinTitleLabel)
        view.addSubview(carbohydrateTitleLabel)
        view.addSubview(fatTitleLabel)
        
        // titleLabel Constraints
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // genderLabel Constraints
        let genderLeading = NSLayoutConstraint(item: genderLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let genderTrailing = NSLayoutConstraint(item: genderLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -200)
        let genderBottom = NSLayoutConstraint(item: genderLabel, attribute: .bottom, relatedBy: .equal, toItem: bodyWeightLabel, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([genderLeading, genderTrailing, genderBottom])
        
        
        // bodyWeightLabel Constraints
        let bodyWeightLeading = NSLayoutConstraint(item: bodyWeightLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let bodyWeightTrailing = NSLayoutConstraint(item: bodyWeightLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -200)
        let bodyWeightBottom = NSLayoutConstraint(item: bodyWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: leanBodyMassLabel, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([bodyWeightLeading, bodyWeightTrailing, bodyWeightBottom])
        
        //leanBodyMassLabel Constraints
        let leanBodyLeading = NSLayoutConstraint(item: leanBodyMassLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let leanBodyTrailing = NSLayoutConstraint(item: leanBodyMassLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -200)
        let leanBodyBottom = NSLayoutConstraint(item: leanBodyMassLabel, attribute: .bottom, relatedBy: .equal, toItem: bodyFatPercentageLabel, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([leanBodyLeading, leanBodyTrailing, leanBodyBottom])
        
        // BodyFatPercentageLabel Constraints
        let bodyFatLeading = NSLayoutConstraint(item: bodyFatPercentageLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let bodyFatTrailing = NSLayoutConstraint(item: bodyFatPercentageLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -200)
        let bodyFatBottom = NSLayoutConstraint(item: bodyFatPercentageLabel, attribute: .bottom, relatedBy: .equal, toItem: goalWeightLabel, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([bodyFatLeading, bodyFatTrailing, bodyFatBottom])
        
        
        // GoalWeightLabel Constraints
        
        let goalLeading = NSLayoutConstraint(item: goalWeightLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let goalTrailing = NSLayoutConstraint(item: goalWeightLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -250)
        let goalBottom = NSLayoutConstraint(item: goalWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: activityLevelTitleLabel, attribute: .top, multiplier: 1, constant: -35)
        
        view.addConstraints([goalLeading, goalTrailing, goalBottom])
        
        // ActivityLevelTitleLabel
        
        let activityLeading = NSLayoutConstraint(item: activityLevelTitleLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let activityTop = NSLayoutConstraint(item: activityLevelTitleLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 420)
        let activityTrailing = NSLayoutConstraint(item: activityLevelTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -250)
        let activityBottom = NSLayoutConstraint(item: activityLevelTitleLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -280)

        view.addConstraints([activityLeading, activityTop, activityTrailing, activityBottom])
    
        // proteinTileLabel Constraints
    let proteinLabelLeading = NSLayoutConstraint(item: proteinTitleLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 60)
    let proteinLabelTop = NSLayoutConstraint(item: proteinTitleLabel, attribute: .top, relatedBy: .equal, toItem: activityLevelTitleLabel, attribute: .bottom, multiplier: 1, constant: 40)
    let proteinLabelTrailing = NSLayoutConstraint(item: proteinTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -250)
    
    view.addConstraints([proteinLabelLeading, proteinLabelTrailing, proteinLabelTop])
        
        // carbohydrateTitleLabel Constraints
        let carbLabelTop = NSLayoutConstraint(item: carbohydrateTitleLabel, attribute: .top, relatedBy: .equal, toItem: activityLevelButton, attribute: .bottom, multiplier: 1, constant: 40)
        let carbLabelTrailing = NSLayoutConstraint(item: carbohydrateTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -60)
        
        view.addConstraints([carbLabelTrailing, carbLabelTop])
        
        // fatTitleLabel Constraints
        let fatLabelBottom = NSLayoutConstraint(item: fatTitleLabel, attribute: .bottom, relatedBy: .equal, toItem: calculateButton, attribute: .top, multiplier: 1, constant: -79)
        fatTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        view.addConstraints([fatLabelBottom])
        
        // proteinBoxLabel Constraints
        let proteinBoxLeading = NSLayoutConstraint(item: proteinBoxLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 70)
        let proteinBoxTop = NSLayoutConstraint(item: proteinBoxLabel, attribute: .top, relatedBy: .equal, toItem: proteinTitleLabel, attribute: .bottom, multiplier: 1, constant: 20)
//      proteinBoxLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        view.addConstraints([proteinBoxLeading, proteinBoxTop])
        
        // carbsBoxLabel Constraints
        let carbsBoxTop = NSLayoutConstraint(item: carbohydrateBoxLabel, attribute: .top, relatedBy: .equal, toItem: carbohydrateTitleLabel, attribute: .bottom, multiplier: 1, constant: 20)
        let carbsBoxTrailing = NSLayoutConstraint(item: carbohydrateBoxLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -60)
//           carbohydrateBoxLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.addConstraints([carbsBoxTop, carbsBoxTrailing])
        
        // fatBoxLabel Constraints
        let fatBoxBottom = NSLayoutConstraint(item: fatBoxLabel, attribute: .bottom, relatedBy: .equal, toItem: calculateButton, attribute: .top, multiplier: 1, constant: -36)
         fatBoxLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.addConstraints([fatBoxBottom])

}
 
//BUTTONS
    func setupButton() {
        
        // ActivityLevelButton Set up
            //Colors and UI
        activityLevelButton = dropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        activityLevelButton.backgroundColor = .blue
        activityLevelButton.setTitle("Activity Level", for: .normal)
        activityLevelButton.setTitleColor(.white, for: .normal)
        activityLevelButton.layer.borderColor = UIColor.blue.cgColor
        activityLevelButton.layer.borderWidth = 1
        
        // CalculateButton Set Up
            // Colors and UI
        calculateButton.backgroundColor = .blue
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.layer.borderColor = UIColor.blue.cgColor
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
        
        // Height and Width for both buttons
        calculateButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // CalculateButton Constraints
        
        calculateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        // Activity Level Button Constraints
        
        let leading = NSLayoutConstraint(item: activityLevelButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 250)
        let top = NSLayoutConstraint(item: activityLevelButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 420)
        let trailing = NSLayoutConstraint(item: activityLevelButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let bottom = NSLayoutConstraint(item: activityLevelButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -280)
   
        view.addConstraints([leading, top, trailing, bottom])
    }
    

    
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
        
        //Tableview constraints.( This is the tableview constrained to the activityLevel Button)
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
        
        // The table few constraints
        
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

