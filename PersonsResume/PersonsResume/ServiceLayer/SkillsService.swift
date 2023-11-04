//
//  SkillsService.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation

class SkillsService: SkillsServiceProtocol {

    private let userDefaults = UserDefaults.standard
    private let skillsKey = "Skills"
    private var defaultSkills = [
        SkillModel(skill: "Swift"),
        SkillModel(skill: "UIKit"),
        SkillModel(skill: "iOS Development"),
        SkillModel(skill: "REST APIs"),
        SkillModel(skill: "Git"),
        SkillModel(skill: "Alamofire"),
        SkillModel(skill: "Kingfisher")
    ]

    func fetchSkills() -> [SkillModel] {
        guard let data = userDefaults.object(forKey: skillsKey) as? Data
        else { return defaultSkills }

        let skills = (try? JSONDecoder().decode([SkillModel].self, from: data)) ?? []
        return skills.isEmpty ? defaultSkills : skills
    }

    func saveSkills(_ skills: [SkillModel]) {
        guard let data = try? JSONEncoder().encode(skills)
        else { return }
        userDefaults.set(data, forKey: skillsKey)
    }
}
