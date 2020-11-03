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
    @IBOutlet var seasonsLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!
    
    var detailItem: Shows? {
        didSet{
            //Update the view
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        title = detailItem?.name
        
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem{
            
            if let imageView = mediaImage {
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
            if let thisTitleLabel = titleLabel{
                thisTitleLabel.text = entry.name
            }

            if let thisYearLabel = yearLabel {
                if let ended = entry.yearEnd {
                    thisYearLabel.text = "\(entry.yearStart) - \(ended)"
                } else {
                    thisYearLabel.text = entry.yearStart
                }
            }
            if let thisSeasonsLabel = seasonsLabel {
                thisSeasonsLabel.text = "\(entry.seasons) Seasons"
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
            if let thisGenresLabel = genresLabel {
                thisGenresLabel.text = entry.genres
            }
            //bottom view stuff
            if let thisDescriptionlabel = descriptionLabel {
                thisDescriptionlabel.text = entry.description
            }
            if let summaryTextView = summaryTextView {
                summaryTextView.text = entry.storyLine
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
            controller.castListArray = detailItem?.castSummary

//                let controller = segue.destination as! DetailViewController
//                controller.detailItem = selectedObject
//            }
        }
    }


}

