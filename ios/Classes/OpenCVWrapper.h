//
//  OpenCVWrapper.h
//  image_blurry
//
//  Created by Gustavo Rebolledo on 22-11-19.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>
#include <string>
#include <vector>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject
    + (NSNumber *) isImageBlurry: (NSString *) imagePath;
@end

NS_ASSUME_NONNULL_END
