//
//  GODeleteWatchRepositoryAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Example: https://api.github.com/user/subscriptions/qclmnt/Gestion-tournoi?access_token={access_token}

class GODeleteWatchRepositoryAPIEntry: GOPutWatchRepositoryAPIEntry {

    // MARK: - QCAPIEntry
    
    override var method: QCAPIMethod {
        return .delete
    }
    
    override var path: String {
        return "user/subscriptions/\(self.repoFullName)?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")"
    }
}
