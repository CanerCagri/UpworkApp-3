//
//  ViewController.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 12.10.2022.
//

import UIKit
import SnapKit
import Photos

class MainViewController: UIViewController {
    
    let pasteLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Paste Tiktok Link"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let pasteLabel2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "We will download without watermark."
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    var tiktokImageView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .systemBackground
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.image = UIImage(named: "tiktok")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tiktokLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Tap to go to Tiktok"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "note")
        imageView.image = image
        text.leftView = imageView
        
        text.textAlignment = .center
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor.systemGray4.cgColor
        text.layer.cornerRadius = 10
        text.textColor = .label
        text.tintColor = .label
        text.font = UIFont.preferredFont(forTextStyle: .title2)
        text.adjustsFontSizeToFitWidth = true
        text.minimumFontSize = 12
        
        text.backgroundColor = .darkGray
        text.autocorrectionType = .no
        text.returnKeyType = .go
        text.clearButtonMode = .whileEditing
        text.attributedPlaceholder = NSAttributedString(string:"Paste Tiktok link here", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font :UIFont(name: "Times New Roman", size: 20)!])
        return text
    }()
    
    let downloadButton: UIButton = {
        var button = UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.textColor = .darkGray
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupUI()
    }
    
    func configureViewController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chart.line.uptrend.xyaxis"), style: .done, target: self, action: #selector(rightBarButtonTapped))
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        view.backgroundColor = .systemBrown
        title = "SavingTok"
    }
    
    @objc func leftBarButtonTapped() {
        
    }
    
    @objc func rightBarButtonTapped() {
        
    }
    
    func setupUI() {
        view.addSubview(pasteLabel)
        pasteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        view.addSubview(pasteLabel2)
        pasteLabel2.snp.makeConstraints { make in
            make.top.equalTo(pasteLabel.snp.bottom)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        view.addSubview(tiktokImageView)
        tiktokImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        view.addSubview(tiktokLabel)
        tiktokLabel.snp.makeConstraints { make in
            make.top.equalTo(tiktokImageView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(downloadButton.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
    }
    
  
    
    @objc func downloadButtonTapped() {
        
        let url = "https://www.tiktok.com/@bayashi.tiktok/video/7129095826332241154?is_copy_url=1&is_from_webapp=v1"

        guard let videoURL = URL(string: url) else { return }

                guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

                // check if the file already exist at the destination folder if you don't want to download it twice
                if !FileManager.default.fileExists(atPath: documentsDirectoryURL.appendingPathComponent(videoURL.lastPathComponent).path) {

                    // set up your download task
                    URLSession.shared.downloadTask(with: videoURL) { (location, response, error) -> Void in

                        // use guard to unwrap your optional url
                        guard let location = location else { return }

                        // create a deatination url with the server response suggested file name
                        let destinationURL = documentsDirectoryURL.appendingPathComponent(response?.suggestedFilename ?? videoURL.lastPathComponent)

                        do {

                            try FileManager.default.moveItem(at: location, to: destinationURL)

                            PHPhotoLibrary.requestAuthorization({ (authorizationStatus: PHAuthorizationStatus) -> Void in

                                // check if user authorized access photos for your app
                                if authorizationStatus == .authorized {
                                    PHPhotoLibrary.shared().performChanges({
                                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: destinationURL)}) { completed, error in
                                            if completed {
                                                print("Video asset created")
                                            } else {
                                                print(error)
                                            }
                                    }
                                }
                            })

                        } catch { print(error) }

                    }.resume()

                } else {
                    print("File already exists at destination url")
                }
     
    }
    
}

