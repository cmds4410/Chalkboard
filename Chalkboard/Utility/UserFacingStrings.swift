//
//  UserFacingStrings.swift
//  Chalkboard
//
//  Created by Connor Smith on 4/15/18.
//  Copyright © 2018 Connor Smith. All rights reserved.
//

import Foundation

struct UserFacingStrings {

    struct Common {
        static let Okay = "Okay"
    }

    struct Network {
        struct Error {
            static let Title = "Uh oh!"
            static let Message = "There seems to have been a network error. Please tell Connor to get off his lazy butt and fix it!"
        }
    }

    struct CloudKit {
        static let SignInTitle = "Sign in to iCloud"
        static let SignInMessage = "Sign in to your iCloud account to write records. On the Home screen, launch Settings, tap iCloud, and enter your Apple ID. Turn iCloud Drive on. If you don't have an iCloud account, tap Create a new Apple ID."
    }

}
