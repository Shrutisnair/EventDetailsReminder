//
//  Entity.h
//  Sample
//
//  Created by Shruthi on 28/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entity : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@property (nullable, nonatomic, retain) NSString *eventAddress;
@property (nullable, nonatomic, retain) NSString *eventDate;
@property (nullable, nonatomic, retain) NSString *eventDesc;
@property (nullable, nonatomic, retain) NSString *eventId;
@property (nullable, nonatomic, retain) NSString *eventLocation;
@property (nullable, nonatomic, retain) NSString *eventName;
@property (nullable, nonatomic, retain) NSString *eventRating;
@property (nullable, nonatomic, retain) NSString *eventTime;


@end

NS_ASSUME_NONNULL_END

#import "Entity+CoreDataProperties.h"
