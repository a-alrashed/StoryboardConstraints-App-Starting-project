//
//  MainViewController.swift
//  StoryboardConstraints App
//
//  Created by Azzam R Alrashed on 15/12/2020.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nightStarsImage: UIImageView!
    @IBOutlet weak var morningBirdsImage: UIImageView!
    
    @IBOutlet weak var moonAndSunView: UIView!
    @IBOutlet weak var nightFilterView: UIView!
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = getHijriCalendearDate()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func didChangeSwitchValue(_ sender: UISwitch) {
        if sender.isOn {
            // show the night animation
            nightAnimation()
        } else {
            //show the morning animation
            morningAnimation()
        }
    }
    
    func nightAnimation() {
        UIView.animate(withDuration: 2) {
            self.mainLabel.text = "اذكار المساء"
            self.mainLabel.textColor = UIColor.white
            self.dateLabel.textColor = UIColor.white
            self.moonAndSunView.rotation = 180
            self.nightStarsImage.alpha = 1
            self.morningBirdsImage.alpha = 0
            self.view.backgroundColor = UIColor(named: "Night background")
            self.nightFilterView.alpha = 0.5
        }
    }
    
    func morningAnimation() {
        UIView.animate(withDuration: 2) {
            self.mainLabel.text = "اذكار الصباح"
            self.mainLabel.textColor = UIColor(named: "Morning font color")
            self.dateLabel.textColor = UIColor(named: "Morning font color")
            self.moonAndSunView.rotation = 0
            self.nightStarsImage.alpha = 0
            self.morningBirdsImage.alpha = 1
            self.view.backgroundColor = UIColor(named: "Morning background")
            self.nightFilterView.alpha = 0
        }
    }
    
    func getHijriCalendearDate() -> String {
        let hijriCalendar = Calendar(identifier: .islamicCivil)
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ar")
        formatter.calendar = hijriCalendar
        formatter.dateFormat = "EEE dd MMMM yyyy"
        
        return formatter.string(from: Date())
    }

}

extension MainViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
