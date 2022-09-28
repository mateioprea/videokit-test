#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(Videokit2, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end


@interface RCT_EXTERN_REMAP_MODULE(VideoKit, VideoKitManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(isActive, BOOL);
RCT_EXPORT_VIEW_PROPERTY(source, NSString)
RCT_EXPORT_VIEW_PROPERTY(paused, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onError, RCTDirectEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onInitialized, RCTDirectEventBlock);

RCT_EXTERN_METHOD(play:(nonnull NSNumber *) node)
RCT_EXTERN_METHOD(pause:(nonnull NSNumber *) node)
RCT_EXTERN_METHOD(isPlaying:(nonnull NSNumber *) node)
RCT_EXTERN_METHOD(replay:(nonnull NSNumber*) node)
RCT_EXTERN_METHOD(seekToBeginning:(nonnull NSNumber*) node)
@end
