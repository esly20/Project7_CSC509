//
//  ScheduleCollectionViewController.swift
//  Project7
//
//  Created by student on 2/20/20.
//  Copyright © 2020 CSC509. All rights reserved.
//
import UIKit

class ScheduleCollectionViewController: UICollectionViewController {
    
    var periods = [Schedules]()
    private let reuseIdentifier = "BlockCell"
    private let itemsPerRow: CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 10.0,
                                     left: 20.0,
                                     bottom: 10.0,
                                     right: 20.0)
//    var weekDays: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
//    var classPeriods: [String] = ["1", "2a", "2b"]
    var weekDays: [String] = ["Day"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://summer-session-api.herokuapp.com/student/1/schedule"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            } else {
                print("error getting data")
            }
        }
        showError()
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
            if let jsonPeriods = try? decoder.decode(Periods.self, from: json) {
                periods = jsonPeriods.schedule
                print(periods)
                collectionView.reloadData()
            } else {
                print("error decoding json")
            }
            
            print("successfully loaded data")
        }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return weekDays.count
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return periods.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlockCell", for: indexPath) as! ScheduleCollectionViewCell
        print(indexPath.row, periods.count)
        let schedule = periods[indexPath.row]
        cell.nameLabel.text = schedule.name
        cell.timeStartLabel.text = "Begin: \(schedule.time_start)"
        cell.timeEndLabel.text = "End: \(schedule.time_end)"
        cell.instructorLabel.text = schedule.instructor
        cell.locationLabel.text = schedule.location
        return cell
    }
   
}

extension ScheduleCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
