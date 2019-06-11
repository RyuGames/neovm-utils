//
//  CES1.swift
//  neovmUtils
//
//  Created by Wyatt Mufson on 6/10/19.
//  Copyright © 2019 Ryu Blockchain Technologies. All rights reserved.
//

import UIKit

public final class CES1Interface: OEP5Interface {

    public func nameOf(tokenId: Any) -> String {
        let token = strOrIntToParam(arg: tokenId)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "nameOf", args: [token])
        return hex.hexToAscii()
    }

    public func getRarity(tokenId: Any) -> String {
        let token = strOrIntToParam(arg: tokenId)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "getRarity", args: [token])
        return hex.hexToAscii()
    }

    public func getDNA(tokenId: Any) -> String {
        let token = strOrIntToParam(arg: tokenId)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "getDNA", args: [token])
        return hex
    }

    public func getRaritySupply(rarity: String) -> Int {
        let param = OntologyParameter(type: .String, value: rarity)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "getRaritySupply", args: [param])
        return hex.hexToDecimal()
    }

    public func getNameSupply(name: String) -> Int {
        let param = OntologyParameter(type: .String, value: name)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "getNameSupply", args: [param])
        return hex.hexToDecimal()
    }

    public func getRarityAndNameSupply(rarity: String, name: String) -> Int {
        let rparam = OntologyParameter(type: .String, value: rarity)
        let nparam = OntologyParameter(type: .String, value: name)
        let hex = ontologyInvokeRead(endpoint: endpoint, contractHash: contractHash, method: "getRarityAndNameSupply", args: [nparam, rparam])
        return hex.hexToDecimal()
    }

    public func mint(tokenName: String, address: String, gasPrice: Int = 500, gasLimit: Int = 20000, wallet: Wallet) -> String {
        return mint(tokenName: tokenName, address: address, gasPrice: gasPrice, gasLimit: gasLimit, wif: wallet.wif)
    }

    public func mint(tokenName: String, address: String, gasPrice: Int = 500, gasLimit: Int = 20000, wif: String) -> String {
        let name = OntologyParameter(type: .String, value: tokenName)
        let receiver = OntologyParameter(type: .Address, value: address)
        return ontologyInvoke(endpoint: endpoint, contractHash: contractHash, method: "mint", args: [name, receiver], gasPrice: gasPrice, gasLimit: gasLimit, wif: wif)
    }

    @available(*, unavailable, message:"CES1 Assets do not support approvalForAll")
    override public func approvalForAll(owner: String, to: String, approval: Bool, gasPrice: Int = 500, gasLimit: Int = 20000, wallet: Wallet) -> String {
        return ""
    }

    @available(*, unavailable, message: "CES1 Assets do not support approvalForAll")
    override public func approvalForAll(owner: String, to: String, approval: Bool, gasPrice: Int = 500, gasLimit: Int = 20000, wif: String) -> String {
        return ""
    }

    @available(*, unavailable, message: "CES1 Assets do not support tokenMetadata")
    override public func tokenMetadata(tokenId: Any) -> String {
        return ""
    }
}
