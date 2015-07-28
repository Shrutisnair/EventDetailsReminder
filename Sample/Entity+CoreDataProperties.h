//
//  Entity+CoreDataProperties.h
//  Sample
//
//  Created by Shruthi on 28/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Entity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Entity (CoreDataProperties)

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
