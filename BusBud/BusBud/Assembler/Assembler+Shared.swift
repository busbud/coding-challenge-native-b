//
//  SharedAssembler.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssmbler: Assembler = {
        let container = Container()
        let assembler = Assembler([APIAssembly(),
                                   SearchServiceAssembly(),
                                   SearchViewAssembly()],
                                  container: container)
        return assembler
    }()
}
