//
//  ContentView.swift
//  Learning App (Recap)
//
//  Created by Almat Alibekov on 16.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink(destination:
                                        ContentDetailView()
                            .onAppear(perform: {
                                model.beginLesson(index)
                            }),
                                       label: {
                                            ContentViewRow(index: index)
                                        })
                        
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
        }
        
        
    }
}

