//
//  ContentModel.swift
//  Learning App (Recap)
//
//  Created by Almat Alibekov on 16.03.2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK - Data methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            
            // TODO log error
            print("Couldn't parse local data")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
         let styledata = try Data(contentsOf: styleUrl!)
            
            self.styleData = styledata
            
        }
        catch {
            print("Couldn't parse style data")
            
        }
       
        
    }
    
    // MARK: - MOdule navigation methods
    
    func beginModule(_ moduleId: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleId {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
            
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
        
    }
    
    func beginLesson(_ lessonIndex: Int) {
        
        // Check that the lesson index is within range if module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentModuleIndex = lessonIndex
        } else {
            currentLessonIndex  = 0
            
        }
        // Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
}
