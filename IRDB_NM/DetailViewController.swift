//
//  ViewController.swift
//  IRDB_NM
//
//  Created by Nathan Mckenzie on 11/2/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!
    
    var detailItem: Entry? {
        didSet{
            //Update the view
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let nav = self.navigationController?.navigationBar
      
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
        title = detailItem?.name
        
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem{
            
            if let thisMediaImage = mediaImage{
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!)
                
                thisMediaImage.image = UIImage(data: data!)
            }
            if let thisTitleLabel = titleLabel{
                thisTitleLabel.text = entry.name
            }
            if let thisYearLabel = yearLabel{
                if (entry.yearStart == entry.yearEnd) {
                    thisYearLabel.text = entry.yearStart
                }
                else if (entry.yearEnd != nil && entry.yearEnd != " - ") {
                    thisYearLabel.text = "\(entry.yearStart) - \(entry.yearEnd ?? "") "
                }
                else {
                thisYearLabel.text = entry.yearStart
                }
            }
            if let thisFormatLabel = formatLabel{
                thisFormatLabel.text = entry.format
            }
            if let thisEpisodeLabel = episodeLabel{
                thisEpisodeLabel.text = " "
                if let episodeCount = entry.episodes {
                    if(entry.episodes == 1) {
                        thisEpisodeLabel.text = "\(episodeCount) Episode"
                    }
                    else {
                    thisEpisodeLabel.text = "\(episodeCount) Episodes"
                    }
                }
            }
            if let thisStudioLabel = studioLabel{
                thisStudioLabel.text = entry.studio
            }
            
            //bottom view stuff
            if let thisDecriptionLabel = descriptionLabel{
                thisDecriptionLabel.text = entry.description
            }
            if let thisSummaryTextView = summaryTextView{
                thisSummaryTextView.text = entry.summary
            }
        }
        
       
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList" {
            
            let controller = segue.destination as! CastTableViewController
            controller.castListArray = detailItem?.starring

//                let controller = segue.destination as! DetailViewController
//                controller.detailItem = selectedObject
//            }
        }
    }


}

