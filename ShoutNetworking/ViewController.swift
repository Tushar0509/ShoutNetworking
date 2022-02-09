//
//  ViewController2.swift
//  ShoutNetworking
//
//  Created by Tushar Elangovan on 01/02/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let cellID = "Cell"

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RealData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCell
        
 
        let deets = RealData[indexPath.row]
    
        let url = URL(string: deets.avatarmain)
        let data = try? Data(contentsOf: url!)
        if let image = data{
            cell.ImgView.image = UIImage(data: data!)
        }
        else{
            cell.ImgView.image = UIImage(named: "Face")
            debugPrint("Image Error")
        }
        return cell
    }
    

        //MARK: -Initial Declarations
        var responseList = [UserDetails]()
        var jSonData: UserResponse? = nil
    var RealData = [UserDetails](){
        didSet {
            DispatchQueue.main.async {
                self.CollevtioView.reloadData()
                debugPrint("Found: \(self.RealData.count) items")
                
            }
        }
    }
        
        //MARK: -UI Declaration
        lazy var iconNotification: UIImageView = {
            let l = UIImageView()
            l.image = UIImage(systemName: "bell")
            l.translatesAutoresizingMaskIntoConstraints = false
            l.tintColor = .black
            l.contentMode = .scaleAspectFill
            return l
        }()
        
        lazy var icondots: UIImageView = {
            let l = UIImageView()
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        
        lazy var iconMessage: UIImageView = {
            let l = UIImageView()
            l.image = UIImage(systemName: "message")
            l.tintColor = .black
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        lazy var lblHeading: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "\"feeling Goofy\""
            l.adjustsFontSizeToFitWidth = true
            l.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            return l
        }()
        
        lazy var imageAvatar: UIImageView = {
            let l = UIImageView()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.image = UIImage(named: "Face")
            l.contentMode = .scaleAspectFit
            return l
        }()
        
        lazy var lblAgeInterest: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "28 yr old, Fitness Enthusiast"
           // l.font = UIFont.preferredFont(forTextStyle: .subheadline)
            l.font = UIFont.boldSystemFont(ofSize: 18)
            l.adjustsFontSizeToFitWidth = true
            return l
        }()
        
        lazy var lblShortBio: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "Social media VP at an Ad agency, biggest dog lover you can meet"
            l.numberOfLines = 3
            l.font = UIFont.preferredFont(forTextStyle: .title3)
            l.textAlignment = .center
            l.adjustsFontSizeToFitWidth = true
            return l
        }()
    
    
       lazy var CollevtioView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let l = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        l.dataSource = self
        l.delegate = self
        l.translatesAutoresizingMaskIntoConstraints = false
        l.register(CustomCell.self, forCellWithReuseIdentifier: cellID)
           l.showsHorizontalScrollIndicator = false
        return l
      }()
    
    lazy var BtnCall: UIImageView = {
        let l = UIImageView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.tintColor = .yellow
        l.image = UIImage(systemName: "phone.fill")
        l.contentMode =  .scaleAspectFill
        return l
    }()
    
        
        //MARK: - UI setUp
        func setupIconNotification(){
            NSLayoutConstraint.activate([
            
                iconNotification.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 5),
                iconNotification.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
                iconNotification.widthAnchor.constraint(equalToConstant: 40),
                iconNotification.heightAnchor.constraint(equalToConstant: 40)
                
            ])
            
        }
        
        func setupIconMessage(){
            NSLayoutConstraint.activate([
            
                iconMessage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 5),
                iconMessage.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5),
                iconMessage.widthAnchor.constraint(equalToConstant: 40),
                iconMessage.heightAnchor.constraint(equalToConstant: 40)
                
            ])
            
        }
        
        func setupLblHeading(){
            NSLayoutConstraint.activate([
            
                lblHeading.topAnchor.constraint(equalTo: iconNotification.layoutMarginsGuide.bottomAnchor,constant: view.frame.height/12),
                lblHeading.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            ])
        }
        
        
        func setupImageAvatar(){
            NSLayoutConstraint.activate([
            
            
                imageAvatar.topAnchor.constraint(equalTo: lblHeading.bottomAnchor,constant: 10),
                imageAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageAvatar.heightAnchor.constraint(equalToConstant: view.frame.height/3)
                
                
            
            ])
        }

        func setupLblAgeInterest(){
            NSLayoutConstraint.activate([
            
            
                lblAgeInterest.topAnchor.constraint(equalTo: imageAvatar.layoutMarginsGuide.bottomAnchor, constant: 15),
                lblAgeInterest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            ])
        }
        
        func setupLblShortBio(){
            NSLayoutConstraint.activate([
            
                lblShortBio.topAnchor.constraint(equalTo: lblAgeInterest.layoutMarginsGuide.bottomAnchor,constant: view.frame.height/25),
               // lblShortBio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lblShortBio.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
                lblShortBio.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5),
                lblShortBio.heightAnchor.constraint(equalToConstant: view.frame.height/8)
            ])
        }
    
    
    func setupCollectionView(){
        NSLayoutConstraint.activate([
        
            CollevtioView.topAnchor.constraint(equalTo: lblShortBio.layoutMarginsGuide.bottomAnchor, constant: 10),
            CollevtioView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CollevtioView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CollevtioView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CollevtioView.heightAnchor.constraint(equalToConstant: view.frame.height/8)
        
        ])
    }
    
    func setupBtnCall(){
        
       
        NSLayoutConstraint.activate([
        
            BtnCall.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -5),
//            BtnCall.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            BtnCall.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            BtnCall.heightAnchor.constraint(equalToConstant: view.frame.width/6),
            BtnCall.widthAnchor.constraint(equalToConstant: view.frame.width/6),
            BtnCall.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        BtnCall.layer.cornerRadius = view.frame.width/12
    }
    
    //MARK: -Collection View Functions
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/8, height: view.frame.height/8)
    }
    
    
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("Clicked on:\(indexPath.row)")
           changeDetails(i: indexPath.row)
       }
    
    func changeDetails(i: Int){
        
        let user = RealData[i]
        lblAgeInterest.text = "\(user.age) yrs old, \(user.interest)"
        lblShortBio.text = user.short_bio.decodeUrl()?.replacingOccurrences(of: "+", with: " ").replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: "%", with: " ")
        debugPrint("Res:\(user.short_bio)")
        displayImage(urll: user.avatarmain)
        let name = user.name.components(separatedBy: " ").first!
        debugPrint("Name:\(name)")
        
        lblHeading.text! = "\"\(user.avatarmain.slice(from: name, to: ".png")?.replacingOccurrences(of: "_", with: " ") ?? "Name Format Error")\""
     
    }
    
        //MARK: -Fetch Data
           func jsonDataPull(){
               let userRequest = UserRequest()
             debugPrint("here")
                 userRequest.getResponse { [weak self] result in
                     switch result {
                     case .failure(let error):
                         print("Error")
                         print(error)
                     case .success(let detail):
                         print(detail)
                         self!.RealData = detail
                         debugPrint("Real Data Name: \(self!.RealData.count)")
                     }
                 }
           }
           
           //MARK: -Image Display (From URL)
           func displayImage(urll: String){
               let url = URL(string: urll)
               let data = try? Data(contentsOf: url!)
               if let image = data{
                   imageAvatar.image = UIImage(data: data!)
               }
               else{
                   debugPrint("Image Error")
               }
           }
    
           //MARK: -View Did Load
           override func viewDidLoad() {
               super.viewDidLoad()
               
               //MARK: Json Response
               jsonDataPull()
               
               //MARK: Add Subviews
               view.backgroundColor = .white
               view.addSubview(iconNotification)
               view.addSubview(iconMessage)
               view.addSubview(lblHeading)
               view.addSubview(imageAvatar)
               view.addSubview(lblAgeInterest)
               view.addSubview(lblShortBio)
               view.addSubview(CollevtioView)
               view.addSubview(BtnCall)
        
               //MARK: Setup Ui
               setupIconNotification()
               setupIconMessage()
               setupLblHeading()
               setupImageAvatar()
               setupLblAgeInterest()
               setupLblShortBio()
               setupCollectionView()
               setupBtnCall()
               
               
           }
     
           
}

//MARK: -Extensions
extension String{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
    func slice(from: String, to: String) -> String? {
            guard let rangeFrom = range(of: from)?.upperBound else { return nil }
            guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
            return String(self[rangeFrom..<rangeTo])
        }
}


