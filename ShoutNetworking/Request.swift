//
//  Request.swift
//  ShoutNetworking
//
//  Created by Tushar Elangovan on 29/01/22.
//

import Foundation

//MARK: -Error Handling
enum UserReqeustError: Error{
    case noDataPresent
    case ProcessingError

}

struct UserRequest {

    //MARK: - Resource URL
    let resourceURL = URL(string: "http://34.87.72.15/api/dating_api/launchscreen/getdialerdata.php?memberid=9&conversationid=0")!
    
 

    //MARK: -Response Function
    func getResponse(completion: @escaping(Result<[UserDetails],UserReqeustError>) -> Void){
        let datatask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataPresent))
                return
            }
            print(jsonData)
            
            do {
                let decoder = JSONDecoder()
                debugPrint("Start Deecoding")
                let userResponse = try decoder.decode(UserResponse.self, from: jsonData)
                debugPrint("So far so good")
                let userDetails = userResponse.resource
                completion(.success(userDetails))
                
            }catch{
                completion(.failure(.ProcessingError))
                return
            }
            
            

        }
    
        datatask.resume()
        

    }
    
}
