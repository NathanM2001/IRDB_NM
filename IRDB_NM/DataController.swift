//
//  DataController.swift
//  IRDB_NM
//
//  Created by Nathan Mckenzie on 11/2/20.
//

import UIKit

class DataController: NSObject {
    
    let JSONURL = "https://api.jsonbin.io/b/5fa0d730a03d4a3bab0bc1e2"
    
    var dataModel: MediaDataModel?
    
    func getJSONData(completion: @escaping (_ dataModel: MediaDataModel) -> ()){
        
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!){
            (data, response, error) in
            
            guard let thisData = data else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(MediaDataModel.self, from: thisData)
                
                self.dataModel = thisMediaData
                print(thisMediaData.TVShows[0].show[0].storyLine)
                //call back the completion handler and let them know we are done
                
                //go back to the main thread
                DispatchQueue.main.async{
                    completion(self.dataModel!)
                }
            }catch let err{
                print("ERROR WAS: ", err)
            }
            
           
        }
        dataTask.resume()
        
    }

}
