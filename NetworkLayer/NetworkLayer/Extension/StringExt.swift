//
//  StringExt.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

import CryptoKit

extension String {
    func md5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
                String(format: "%02hhx", $0)
            }.joined()
    }
}
