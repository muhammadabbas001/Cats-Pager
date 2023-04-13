//
//  ViewController.swift
//  CatsApp
//
//  Created by Zeeshan Suleman on 27/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButtonAction: UIButton!
    @IBOutlet weak var playOrStopButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    private var duration: Double = 3
    private var timer: Timer?
    private var isTimerWorking = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        setupView()
        layoutCollectionView()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    /// Initial View Setup
    func setupView(){
        backButton.layer.cornerRadius = 5
        forwardButtonAction.layer.cornerRadius = 5
        playOrStopButton.layer.cornerRadius = 5
        settingsButton.layer.cornerRadius = 5
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func layoutCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = collectionView.bounds.size
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
    }
    
    /// Start Timer
    func startTimer(){
        if isTimerWorking{
            timer?.invalidate()
        }
        isTimerWorking = true
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    /// Stop Timer
    func stopTimer(){
        isTimerWorking = false
        timer?.invalidate()
    }
    
    /// Reverse image slider
    func backSlider(){
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < 10 && nextItem.row >= 0{
            self.collectionView.scrollToItem(at: nextItem, at: .right, animated: true)
        }else{
            let nextItem: IndexPath = IndexPath(item: 9, section: 0)
            self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
        }
    }
    
    /// Forward image slider
    func forwardSlider(){
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < 10 {
            self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
        }else{
            let nextItem: IndexPath = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
        }
    }
    
    @objc func fireTimer() {
        forwardSlider()
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        backSlider()
    }
    
    @IBAction func playOrStopButtonAction(_ sender: UIButton) {
        if isTimerWorking{
            stopTimer()
        }else{
            startTimer()
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: UIButton) {
        forwardSlider()
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        let vc = SettingsViewController.create(storyboard: "Main")
        vc.duration = duration
        vc.onSliderChange = { [weak self] value in
            self?.duration = value
            self?.startTimer()
        }
        push(vc)
    }
    
}


// MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsCollectionViewCell.identifier, for: indexPath) as? CatsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let imageName = "cat" + "\(indexPath.row + 1)"
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
