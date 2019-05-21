//
//  OntologyWallet.swift
//  neovmUtils_Tests
//
//  Created by Wyatt Mufson on 5/20/19.
//  Copyright © 2019 Ryu Blockchain Technologies. All rights reserved.
//

import UIKit

typealias Account = Wallet

public final class OntologyWallet: Codable {
    var name: String = ""
    let version: String = "1.0"
    var scrypt: [String: Int] = [:]
    var defaultOntid: String = ""
    var defaultAccountAddress: String = ""
    var createTime: String = ""
    var identities: [Identity] = []
    var accounts: [Account] = []

    init(name: String) {
        self.name = name
        self.createTime = getTimestamp()
    }

    func addIdentity(ident: Identity) {
        self.identities.append(ident)
        if self.defaultOntid == "" {
            self.defaultOntid = ident.ontid
        }
    }

    func addAccount(acc: Account) {
        self.accounts.append(acc)
        if self.defaultAccountAddress == "" {
            self.defaultAccountAddress = acc.address
        }
    }

    func setDefaultOntId(ident: Identity) {
        for identity in self.identities {
            if ident.ontid == identity.ontid {
                self.defaultOntid = ident.ontid
                return
            }
        }
        self.identities.append(ident)
        self.defaultOntid = ident.ontid
    }

    func setDefaultAccountAddress(acc: Account) {
        for account in self.accounts {
            if acc.address == account.address {
                self.defaultAccountAddress = acc.address
                return
            }
        }
        self.accounts.append(acc)
        self.defaultAccountAddress = acc.address
    }
}

fileprivate func getTimestamp() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
    return dateFormatter.string(from: date)
}