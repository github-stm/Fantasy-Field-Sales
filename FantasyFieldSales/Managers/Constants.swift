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
    

    
    static let backgroundColorContent = [ UIColor.red, UIColor.green]
  
    
    static let teamGroup = ["City", "Regional", "Quality", "Test", "Test2", "Test3"]
    // ------------------------------------------------------------------------------------------------------------
    
    static let teams = [(pos: 1, team: "London North", points: 120)
        ,(pos: 2, team: "London South", points: 100)
        ,(pos: 3, team: "South Coast", points: 90)
        ,(pos: 4, team: "London North", points: 120)
        ,(pos: 5, team: "London South", points: 100)
        ,(pos: 6, team: "South Coast", points: 90)
        ,(pos: 7, team: "London North", points: 120)
        ,(pos: 8, team: "London South", points: 100)
        ,(pos: 9, team: "South Coast", points: 90)
        ,(pos: 10, team: "London North", points: 120)
        ,(pos: 11, team: "London South", points: 100)
        ,(pos: 12, team: "South Coast", points: 90)
        ,(pos: 13, team: "South Coast", points: 90)
        ,(pos: 14, team: "London North", points: 120)
        ,(pos: 15, team: "London South", points: 100)
        ,(pos: 16, team: "South Coast", points: 90)
        ,(pos: 17, team: "London North", points: 120)
        ,(pos: 18, team: "London South", points: 100)
        ,(pos: 19, team: "South Coast", points: 90)
        ,(pos: 20, team: "London North", points: 120)
   
    ]

   
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

    
    struct Notification
    {
        static let dateSelectedNotification = "DateSelectedNotification"

        
    }
    
    
    
    struct CallToActionButton {
        static let borderWidth:CGFloat = 2
    }
    
    struct leagueTable {
        static let headerHeight:CGFloat = 45
        static let footerHeight:CGFloat = 75
        static let rowHeight:CGFloat = 75

    }

    struct dateFormat {
        static let monthYear = "MMMM yyyy"
        static let shortMonth = "MMM"
    }
    

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
        static let mediumFontSize:CGFloat = 17
        static let smallFontSize:CGFloat = 13
    }
    
    
    struct string {
        static let newsHeader = "WHSmith 'sorry' for Pinderfields Hospital £7.99 toothpaste"
        static let newsBody2 = "WHSmith has admitted it made more than £700 by selling single tubes of toothpaste for £7.99 in a hospital. \n The Pinderfields Hospital branch in Wakefield was caught selling Colgate, normally priced at £2.49, by a visitor."
        
        static let newsBody = "WHSmith has admitted it made more than £700 by selling single tubes of toothpaste for £7.99 in a hospital. \n The Pinderfields Hospital branch in Wakefield was caught selling Colgate, normally priced at £2.49, by a visitor. \n The retailer blamed a pricing error and said proceeds from the sales would be donated to St George's Crypt in Leeds. \n In 2015, WHSmith was accused of exploiting hospital customers after the BBC found it was charging less on the high street. \n The retailer said 89 tubes of toothpaste had been sold in the Pinderfields shop while they were priced at £7.99."
        
    }
   
  
  
}
