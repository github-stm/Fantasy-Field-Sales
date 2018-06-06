//
//  Constants.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


enum MenuPosition :Int {
    case Right
    case Center
    case Left
}


enum FooterType :Int {
    case NoFooter
    case ViewFullTable
}



class Constants: NSObject {
    struct general {
        static let appName = "Fantansy Field Sales"
    }
    
    // ------------------------------------------------------------------------------------------------------------
    

    
    static let backgroundImageContent = [ "image", "Best Regional image"]
  
    
    static let teamGroup = ["City", "Regional", "Quality", "Collage", "Vacancy"]
    // ------------------------------------------------------------------------------------------------------------
    
    static let teams = [(pos: 1, team: "London North", points: 150, image: "")
        ,(pos: 2, team: "Glassgow", points: 140, image: "up")
        ,(pos: 3, team: "Edinburgh", points: 127, image: "")
        ,(pos: 4, team: "Bristol", points: 120, image: "down")
        ,(pos: 5, team: "Cardiff & Swansea", points: 115, image: "")
        ,(pos: 6, team: "Brighton", points: 98, image: "")
        ,(pos: 7, team: "South West London", points: 97, image: "down")
        ,(pos: 8, team: "Nottingham", points: 83, image: "up")
        ,(pos: 9, team: "Leicester", points: 80, image: "")
        ,(pos: 10, team: "Liverpool", points: 75, image: "")
        ,(pos: 11, team: "Mancheastor", points: 74, image: "")
        ,(pos: 12, team: "Devon", points: 67, image: "down")
        ,(pos: 13, team: "South Coast", points: 65, image: "down")
        ,(pos: 14, team: "Hull", points: 44, image: "")
        ,(pos: 15, team: "Bournemouth", points: 42, image: "")
        ,(pos: 16, team: "Newcastle", points: 31, image: "up")
        ,(pos: 17, team: "South Wales", points: 29, image: "")
        ,(pos: 18, team: "London South", points: 25, image: "")
        ,(pos: 19, team: "South Coast", points: 20, image: "")
        ,(pos: 20, team: "Birmingham", points: 17, image: "")
   
    ]

    static let chartData = [(x: 1, y1: 50, y2: 60)
        ,(x: 1, y1: 70, y2: 50)
        ,(x: 2, y1: 20, y2: 40)
        ,(x: 3, y1: 30, y2: 60)
        ,(x: 4, y1: 50, y2: 90)
        ,(x: 5, y1: 10, y2: 70)
        ,(x: 6, y1: 60, y2: 40)
        ,(x: 7, y1: 50, y2: 90)
        ,(x: 8, y1: 90, y2: 40)
        ,(x: 9, y1: 150, y2: 50)
        ,(x: 10, y1: 80, y2: 40)
        ,(x: 11, y1: 70, y2: 90)
        ,(x: 12, y1: 50, y2: 60)
        
    ]
    
    // ------------------------------------------------------------------------------------------------------------
    
    static let distributionExecutive = [(name: "Vacant", region: "Aberdeen Dundee")
        ,(name: "Vacant", region: "Oxford Reading")
        ,(name: "Francis Cronin", region: "Plymouth/Exeter")
        ,(name: "Kate O’Bryne", region: "Cornwall")
        ,(name: "Richard Cochrane", region: "BlackpoolPreston")
        ,(name: "Robert Holden", region: "Norfolk")
        ,(name: "Delun Jones", region: "Reading")
        ,(name: "Matthew Riddell", region: "Lincoln")
        ,(name: "Jaswinder Sohal", region: "Oxford")
        ,(name: "Kenny Walker", region: "Northampton")
        ,(name: "Shaun Lodge", region: "Chester")
        ,(name: "John Scullion", region: "Ayr")
        ,(name: "Jade Porter", region: "N. Scotland")
    ]

    
    // ------------------------------------------------------------------------------------------------------------
    
    struct notification
    {
        static let dateSelectedNotification = "DateSelectedNotification"
    }

    // ------------------------------------------------------------------------------------------------------------
    
    struct callToActionButton {
        static let borderWidth:CGFloat = 2
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    struct leagueTable {
        static let headerHeight:CGFloat = 45
        static let footerHeight:CGFloat = 75
        static let rowHeight:CGFloat = 75

    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    struct dateFormat {
        static let monthYear = "MMMM yyyy"
        static let shortMonth = "MMM"
    }
    
    // ------------------------------------------------------------------------------------------------------------
    

    struct menu {
        static let width:CGFloat = 200
        static let cellHeight:CGFloat = 30
        static let alertPadding:CGFloat = 30
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    

    struct font {
        static let boldFont = "GillSans-Bold"
        static let regularFont =  "GillSans"
        static let lightFont =  "GillSans-Light"
        static let semiBoldFont =  "GillSans-SemiBold"
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    struct fontSize {
        static let largeFontSize:CGFloat = 22
        static let mediumFontSize:CGFloat = 18
        static let smallFontSize:CGFloat = 15
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    struct text {
        
        static let stats = "Latest Top Stats Leagues"
        
        static let newsHeader = "Diageo launches and prices four-tranche $2 billion fixed and floating rate USD denominated bonds"
        
        static let newsBody = "Diageo, a global leader in beverage alcohol, yesterday launched and priced an SEC-registered $2 billion bond transaction consisting of $500 million floating rate notes due May 2020; $500 million 3.000% notes due May 2020; $500 million 3.500% notes due September 2023; and $500 million 3.875% notes due May 2028.  The issuer of the bonds is Diageo Capital plc, with payment of principal and interest fully and unconditionally guaranteed by Diageo plc."
        
        static let newsHeader2 = "Diageo gives consumers a first-person perspective of binge drinking tragedies in groundbreaking virtual reality series"
        
        static let newsBody2 = "NORWALK, Conn. (April 24, 2018) – Diageo, a global leader in beverage alcohol, today introduced a new virtual reality (VR) experience that will immerse consumers in a first-person, interactive story about the dangers of binge drinking. Diageo is committed to encourage consumers to drink better, not more, and to reduce harmful drinking. “Decisions: Party’s Over” seeks to reduce binge drinking through innovative technology."
        
        
        
    }
   
  
  
}
