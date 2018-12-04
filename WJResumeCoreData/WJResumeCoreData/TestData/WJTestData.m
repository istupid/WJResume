//
//  WJTestData.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJTestData.h"
#import "WJCoreDataManager.h"
#import "Education+CoreDataClass.h"
#import "Job+CoreDataClass.h"
#import "Person+CoreDataClass.h"
#import "Project+CoreDataClass.h"
#import "ProjectSkill+CoreDataClass.h"
#import "ClassSkill+CoreDataClass.h"
#import "Personal+CoreDataClass.h"

@implementation WJTestData

- (instancetype)init {
    if (self = [super init]) {
        [self query];
    }
    return self;
}

- (void)insertData {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"projects-demo.json" ofType:nil]];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
    
    NSArray *educations = rootDict[@"educations"];
    NSMutableSet *eduSet = [NSMutableSet set];
    for (int i = 0; i < educations.count; i++) {
        Education *education = [NSEntityDescription insertNewObjectForEntityForName:@"Education" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
        NSDictionary *dict = educations[i];
        education.index = [dict[@"index"] integerValue];
        education.name = dict[@"name"];
        education.major = dict[@"major"];
        education.endYear = dict[@"endYear"];
        education.person = person;
        [eduSet addObject:education];
    }
    
    NSArray *jobs = rootDict[@"jobs"];
    NSMutableSet *jobSet = [NSMutableSet set];
    for (int i = 0; i < jobs.count; i++) {
        Job *job = [NSEntityDescription insertNewObjectForEntityForName:@"Job" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
        NSDictionary *dict = jobs[i];
        job.index = [dict[@"index"] integerValue];
        job.company = dict[@"company"];
        job.position = dict[@"position"];
        job.time = dict[@"time"];
        job.person = person;
        [jobSet addObject:job];
    }
    
    NSArray *projects = rootDict[@"projects"];
    NSMutableSet *projectSet = [NSMutableSet set];
    for (int i = 0; i< projects.count; i++) {
        Project *project = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
        NSDictionary *dict = projects[i];
        project.index = [dict[@"index"] integerValue];
        project.name = dict[@"name"];
        project.desc = dict[@"desc"];
        project.time = dict[@"time"];
        project.person = person;
        
        NSArray *skills = dict[@"skills"];
        NSMutableSet *skillSet = [NSMutableSet set];
        for (int i = 0; i < skills.count; i++) {
            ProjectSkill *skill = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectSkill" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
            skill.index = [skills[i][@"index"] integerValue];
            skill.desc = skills[i][@"desc"];
            skill.project = project;
            [skillSet addObject:skill];
        }
        project.skills = [skillSet copy];
        [projectSet addObject:project];
    }
    
    NSArray *classSkills = rootDict[@"classSkills"];
    NSMutableSet *classSkillSet = [NSMutableSet set];
    for (int i = 0; i < classSkills.count; i++) {
        ClassSkill *classSkill = [NSEntityDescription insertNewObjectForEntityForName:@"ClassSkill" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
        classSkill.index = [classSkills[i][@"index"] integerValue];
        classSkill.desc = classSkills[i][@"desc"];
        classSkill.person = person;
        [classSkillSet addObject:classSkill];
    }
    
    NSArray *personals = rootDict[@"personals"];
    NSMutableSet *personalSet = [NSMutableSet set];
    for (int i = 0; i < personals.count; i++) {
        Personal *personal = [NSEntityDescription insertNewObjectForEntityForName:@"Personal" inManagedObjectContext:[WJCoreDataManager sharedInstance].context];
        personal.index = [personals[i][@"index"] integerValue];
        personal.desc = personals[i][@"desc"];
        personal.person = person;
        [personalSet addObject:personal];
    }
    
    person.name = rootDict[@"name"];
    person.gander = [rootDict[@"gander"] integerValue];
    person.birthday = rootDict[@"birthday"];
    person.email = rootDict[@"email"];
    person.phone = rootDict[@"phone"];
    person.profession = rootDict[@"profession"];
    person.addr = rootDict[@"addr"];
    person.desc = rootDict[@"desc"];
    person.experience = rootDict[@"experience"];
    
    person.educations = [eduSet copy];
    person.jobs = [jobSet copy];
    person.projects = [projectSet copy];
    person.classSkills = [classSkillSet copy];
    person.personals = [personalSet copy];
    
    
    [[WJCoreDataManager sharedInstance].context save:nil];
}

- (void)query {
    NSFetchRequest *request = [Person fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"name = 'xiongchun'"];
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    request.sortDescriptors = @[sortDesc];
    
    NSArray <Person *> *persons = [[WJCoreDataManager sharedInstance].context executeFetchRequest:request error:nil];
    if (!persons.count) {
        [self insertData];
    }
//    for (Person *person in persons) {
//        NSLog(@"%@, %lud", person.name, (unsigned long)((NSSet *)person.educations).count);
//        NSSet <Education *> *eduSet = person.educations;
//        for (Education *edu in eduSet) {
//            NSLog(@"%zd", edu.index);
//        }
//    }
}

@end
