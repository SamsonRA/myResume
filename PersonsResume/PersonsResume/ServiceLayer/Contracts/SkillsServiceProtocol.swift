//
//  SkillsServiceProtocol.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation

protocol SkillsServiceProtocol {
    func fetchSkills() -> [SkillModel]
    func saveSkills(_ skills: [SkillModel])
}
