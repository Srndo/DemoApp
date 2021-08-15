//
//  Networking.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import Alamofire
import PromiseKit

class Networking {

    func fetchForTableData(_ url: URL) -> Promise<[User]> {
        return Promise { seal in
            Alamofire.request(url).validate().responseJSON { response in
                if let error = response.error {
                    seal.reject(error)
                    return
                }
                guard let data = response.data else {
                    // swiftlint:disable:next line_length
                    seal.reject(NSError(domain: "DemoApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response."]))
                    return
                }
                guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                    // swiftlint:disable:next line_length
                    seal.reject(NSError(domain: "DemoApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Cannot decode data from response."]))
                    return
                }
                seal.fulfill(users)
            }
        }
    }

    func fetchForDetailData(_ url: URL) -> Promise<User> {
        return Promise { seal in
            Alamofire.request(url).validate().responseJSON { response in
                if let error = response.error {
                    seal.reject(error)
                }
                guard let data = response.data else {
                    // swiftlint:disable:next line_length
                    seal.reject(NSError(domain: "DemoApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response."]))
                    return
                }
                guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                    // swiftlint:disable:next line_length
                    seal.reject(NSError(domain: "DemoApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Cannot decode data from response."]))
                    return
                }
                seal.fulfill(user)
            }
        }
    }
}
