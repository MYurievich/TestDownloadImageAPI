//
//  ViewController.swift
//  TestDownloadImageAPI
//
//  Created by Максим on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var downloadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var downloadImageView: UIImageView!
    
    let downloadManager = DownloadManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadIndicator.hidesWhenStopped = true
        downloadIndicator.isHidden = true
        infoLabel.isHidden = false
        
    }

    @IBAction func actionButton(_ sender: UIButton) {
        downloadIndicator.startAnimating()
        infoLabel.isHidden = true
        downloadManager.download() { image in
            DispatchQueue.main.async {
                self.downloadImageView.image = image
                self.downloadIndicator.stopAnimating()
            }
        }
        
    }
    
}

