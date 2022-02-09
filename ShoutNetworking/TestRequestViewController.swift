//
//  TestRequestViewController.swift
//  ShoutNetworking
//
//  Created by Tushar Elangovan on 31/01/22.
//

//import UIKit


//MARK: -To test the Json Respnse View Controller

//class TestRequestViewController: UIViewController {
//
//
//    func jsonDataPull(){
//        let resourceURL = URL(string: "http://34.87.72.15/api/dating_api/launchscreen/getdialerdata.php?memberid=9&conversationid=0")!
//
//        debugPrint("CAlled")
//        let daata2 = URLSession.shared.dataTask(with: resourceURL) { data, _, error in
//            debugPrint("Data")
//            print(data!)
//            do {
//                let decoder = JSONDecoder()
//                debugPrint("Start Decoding")
//                let userResponse = try decoder.decode(UserResponse.self, from: data!)
//                debugPrint("So far so good")
//                debugPrint(userResponse)
//
//                do {
//                    let decoder = JSONDecoder()
//                    debugPrint("Start Deecoding")
//                    let userResponse = try decoder.decode(UserDetails.self, from: data!)
//                    debugPrint("So far so good")
//                    let userDetails = userResponse.name
//
//                    debugPrint(userDetails)
//                    //completion(.success(userDetails.))
//                }catch{
//                    print(error.localizedDescription)
//                    //completion(.failure(.ProcessingError))
//                    return
//                }
//
//
//
//            //    let userDetails = userResponse.resource
//          //      completion(.success(userDetails))
//            }catch{
//                print(error)
//                debugPrint("Error:\(error)")
//          //      completion(.failure(.ProcessingError))
//                return
//            }
//        }
//        daata2.resume()
//}
//
//
//    var RealData = [UserDetails]()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//      let userRequest = UserRequest()
//    debugPrint("here")
//        userRequest.getResponse { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let detail):
//                print(detail)
//                self!.RealData = detail
//                debugPrint("Real Data Name: \(self!.RealData.count)")
//
//                let details = self!.RealData[4]
//                debugPrint("name")
//                debugPrint(details.name)
//
//            }
//        }
//
//
//
//        view.backgroundColor = .green
//        // Do any additional setup after loading the view.
//    }
//
//
//
//}
