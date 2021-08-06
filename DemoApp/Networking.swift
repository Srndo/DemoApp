//
//  Networking.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import Alamofire

/*
                    TODO
 - make one more separate fetch for filling: ID, Name, etc
 - make another fetch to fill remaing data of structure User

 - use storyboarding with Coordinators in weather
 - make extension for reype rootviewController as UINavigationViewController
 */

class Networking {
    typealias WebserviceTableDataResponse = ([CellModel]?, Error?) -> Void
    typealias WebserviceDetailDataResponse = (DetailUserModel?, Error?) -> Void

    func fetchForTableData(_ url: URL, completition: @escaping WebserviceTableDataResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completition(nil, error)
                return
            }
            guard let data = response.data else {
                // swiftlint:disable:next line_length
                completition(nil, NSError(domain: "Coordinator", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response."]))
                return
            }
            guard let users = try? JSONDecoder().decode([CellModel].self, from: data) else {
                // swiftlint:disable:next line_length
                completition(nil, NSError(domain: "Coordinator", code: 0, userInfo: [NSLocalizedDescriptionKey: "Cannot decode data from response."]))
                return
            }
            completition(users, nil)
        }
    }

    func fetchForDetailData(_ url: URL, completition: @escaping WebserviceDetailDataResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completition(nil, error)
                return
            }
            guard let data = response.data else {
                // swiftlint:disable:next line_length
                completition(nil, NSError(domain: "Coordinator", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response."]))
                return
            }
            guard let user = try? JSONDecoder().decode(DetailUserModel.self, from: data) else {
                // swiftlint:disable:next line_length
                completition(nil, NSError(domain: "Coordinator", code: 0, userInfo: [NSLocalizedDescriptionKey: "Cannot decode data from response."]))
                return
            }
            completition(user, nil)
        }
    }
}
