//
//  SettingsViewController.swift
//  CatsApp
//
//  Created by Zeeshan Suleman on 27/03/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var doneButton: UIButton!
    var onSliderChange: ((Double)->())? = nil
    var duration: Double = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    /// Initial View Setup
    func setupView(){
        doneButton.layer.cornerRadius = 5
        slider.value = Float(duration)
    }

    @IBAction func doneButtonAction(_ sender: UIButton) {
        onSliderChange?(Double(slider.value))
        popVC()
    }
}
