 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NSCoding)

+ (id)decodeClass:(id)object decoder:(NSCoder *)aDecoder;
+ (void)encodeClass:(id)object encoder:(NSCoder *)aCoder;

@end

NS_ASSUME_NONNULL_END
