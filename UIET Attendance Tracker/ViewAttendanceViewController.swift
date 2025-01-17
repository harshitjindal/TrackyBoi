//
//  ViewAttendanceViewController.swift
//  UIET Attendance Tracker
//
//  Created by Harshit Jindal on 09/09/19.
//  Copyright © 2019 Harshit Jindal. All rights reserved.
//

import UIKit
import RealmSwift

class ViewAttendanceViewController: UIViewController {

    let realm = try! Realm()
    var selectedType = "Lecture"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        tableView.reloadData()
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedType = "Lecture"
            tableView.reloadData()
        case 1:
            selectedType = "Lab"
            tableView.reloadData()
        default: break
        }
    }
    

}

extension ViewAttendanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedType == "Lecture" { return 5 }
        else { return 4 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordsTableViewCell", for: indexPath) as! RecordsTableViewCell
        cell.progressBar.setProgress(0.0, animated: false)
        cell.attendanceLabel.text = "Attendance: 0%"
        if selectedType == "Lecture" {
            switch indexPath.row {
            case 0:
                cell.subjectNameLabel.text = "Network Security and Cryptography"
                if realm.objects(SubjectData.self).filter("subjectName == 'Network Security and Cryptography' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Network Security and Cryptography' AND subjectType == 'Lecture' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Network Security and Cryptography' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
                
            case 1:
                cell.subjectNameLabel.text = "Design and Analysis of Algorithms"
                if realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lecture' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 2:
                cell.subjectNameLabel.text = "Database Management Systems"
                if realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lecture' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 3:
                cell.subjectNameLabel.text = "Wireless Communication"
                if realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lecture' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 4:
                cell.subjectNameLabel.text = "Python"
                if realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lecture' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lecture' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            default: break
            }
        }
        
        else if selectedType == "Lab" {
            switch indexPath.row {
            case 0:
                cell.subjectNameLabel.text = "Design and Analysis of Algorithms"
                if realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lab' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Design and Analysis of Algorithms' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 1:
                cell.subjectNameLabel.text = "Database Management Systems"
                if realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lab' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Database Management Systems' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 2:
                cell.subjectNameLabel.text = "Wireless Communication"
                if realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lab' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Wireless Communication' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            case 3:
                cell.subjectNameLabel.text = "Python"
                if realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count != 0 {
                    let attendance = Float(realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lab' AND subjectStatus == 'Attended' ").count) / Float(realm.objects(SubjectData.self).filter("subjectName == 'Python' AND subjectType == 'Lab' AND subjectStatus IN {'Attended', 'Missed'}").count)
                    print(attendance)
                    cell.attendanceLabel.text = "Attendance: " + String(format: "%.01f", attendance * 100) + "%"
                    cell.progressBar.setProgress(attendance, animated: true)
                }
                
            default: break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

class RecordsTableViewCell: UITableViewCell {
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
}
