//
//  Learning_App__Recap_App.swift
//  Learning App (Recap)
//
//  Created by Almat Alibekov on 16.03.2023.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
