//
//  DownloadManager.swift
//  TestDownloadImageAPI
//
//  Created by Максим on 12.06.2021.
//

import UIKit

struct DownloadManager {
    func download(completionHandler: @escaping (UIImage)-> Void) {
        let urlString = "https://developer.apple.com/news/images/og/xcode-12-og.jpg"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                completionHandler(image)
            }
        }
        dataTask.resume()
    }
    
}
