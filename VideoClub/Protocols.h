//
//  Protocols.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 27/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#ifndef Protocols_h
#define Protocols_h

@protocol ValidationProtocol <NSObject>


@required

- (BOOL)isValid;

@end

#endif /* Protocols_h */