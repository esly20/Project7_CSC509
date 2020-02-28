//
//  AnnouncementsTableViewController.swift
//  Project7
//
//  Created by Erik Fotta on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class AnnouncementsTableViewController: UITableViewController {

    //Test Variable Declarations
    let titles: [String] = ["Title 0","Title 1","Title 2","Title 3","Title 4","Title 5"]
    let senders: [String] = ["Sender 0","Sender 1","Sender 2","Sender 3","Sender 4","Sender 5"]
    let bodys: [String] = ["""
    Following this week’s upcoming ASM address from author and environmentalist Bill McKibben, we will host a “special edition” of the Climate Café in the Freeman room of the Library from 12:10-1:25.  An array of sandwiches, salad, and cookies will be made available for attendees.  We hope this will be a great Q&A opportunity for interested students!

    More on Mr. McKibben:

    Bill McKibben is an author and environmentalist who in 2014 was awarded the Right Livelihood Prize, sometimes called the ‘alternative Nobel.’ His 1989 book The End of Nature is regarded as the first book for a general audience about climate change, and has appeared in 24 languages; he’s gone on to write a dozen more books. He is a founder of 350.org

    350.org: A global campaign to confront the climate crisis
    We are standing up to the fossil fuel industry to stop all new coal, oil and gas projects and build clean energy for all.
    350.org
    , the first planet-wide, grassroots climate change movement, which has organized twenty  thousand rallies around the world in every country save North Korea, spearheaded the resistance to the Keystone Pipeline, and launched the fast-growing fossil fuel divestment movement.

    The Schumann Distinguished Scholar in Environmental Studies at Middlebury College and a fellow of the American Academy of Arts and Sciences, he was the 2013 winner of the Gandhi Prize and the Thomas Merton Prize, and holds honorary degrees from 18 colleges and universities. Foreign Policy named him to their inaugural list of the world’s 100 most important global thinkers, and the Boston Globe said he was “probably America’s most important environmentalist.”

    A former staff writer for the New Yorker, he writes frequently for a wide variety of publications around the world, including the New York Review of Books,National Geographic, and Rolling Stone. He lives in the mountains above Lake Champlain with his wife, the writer Sue Halpern, where he spends as much time as possible outdoors . In 2014, biologists honored him by naming a new species of woodland gnat— Megophthalmidia mckibbeni--in his honor.

    Hope to see you there!

    Ms. Guerette, Mr. Curtis & Mr. Barker
"""
        ,"Body 1","Body 2","Body 3","Body 4","Body 5"]
    let groups: [String] = ["Group 0","Group 1","Group 2","Group 3","Group 4","Group 5",]
    let times: [String] = ["12:00","12:01","12:02","12:03","12:04","12:05",]
    
    // Variable Declarations
    let defaults = UserDefaults.standard
    var data: DataLayer = DataLayer(userID: 1)
    
    let abbotBlue: UIColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = abbotBlue
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let announcementsData = data.getAnnouncements()!
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if titles.count != 0 {
//            print(announcements.count)
            return titles.count
        } else {
            print("Error with fetching announcements")
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let announcementsData = data.getAnnouncements()!
//        let titles: [String]  = announcementsData.announcement.title
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementCell", for: indexPath)
        if let announcementCell = cell as? AnnouncementsTableViewCell {
            announcementCell.titleLabel?.text = titles[indexPath.row]
            announcementCell.senderLabel?.text = senders[indexPath.row]
            announcementCell.bodyLabel?.text = bodys[indexPath.row]
            announcementCell.groupLabel?.text = groups[indexPath.row]
            announcementCell.timeLabel?.text = times[indexPath.row]
            return announcementCell
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) tapped")
        
        let storyboard = UIStoryboard(name: "AnnouncementsStoryboard", bundle: nil)
        let selectedVC = storyboard.instantiateViewController(identifier: "SelectedVC") as! SelectedAnnouncementViewController
       
        let slcAnnouncement: [String] = ["\(titles[indexPath.row])","\(senders[indexPath.row])","\(bodys[indexPath.row])","\(groups[indexPath.row])","\(times[indexPath.row])"]
        
        defaults.set(slcAnnouncement, forKey: "slcAnnouncement" )
        
        navigationController?.pushViewController(selectedVC, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
