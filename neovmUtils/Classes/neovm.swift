//
//  neovm.swift
//  Pods-neovmUtils_Tests
//
//  Created by Wyatt Mufson on 1/28/19.
//

import Foundation
import Neoutils

func buildOntologyInvocationTransaction(contractHash: String, method: String, args: [[String:Any]], gasPrice: Int, gasLimit: Int, wif: String) -> String? {
    do {
        let data =  try JSONSerialization.data(withJSONObject: args, options: .prettyPrinted)
        let params = String(data: data, encoding: String.Encoding.utf8)
        let err = NSErrorPointer(nilLiteral: ())
        let res = NeoutilsBuildOntologyInvocationTransaction(contractHash, method, params, gasPrice, gasLimit, wif, err)
        return res
    } catch {
        return nil
    }
}
