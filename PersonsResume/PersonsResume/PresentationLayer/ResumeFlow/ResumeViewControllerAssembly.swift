//
//  ResumeViewControllerAssembly.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation
import UIKit

struct ResumeViewControllerAssembly {
    func create() -> UIViewController {
        let resumeView = ResumeView()
        let skillService = SkillsService()

        let controller = ResumeViewController(resumeView: resumeView, service: skillService)

        resumeView.delegate = controller

        return controller
    }
}
