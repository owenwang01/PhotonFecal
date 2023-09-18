#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AVAsset+MSResourceExport.h"
#import "CALayer+MSBornPlumeExtended.h"
#import "MSAttributesFactory.h"
#import "MSBornPlume.h"
#import "MSBornPlumeConst.h"
#import "MSBornPlumeResourceLoader.h"
#import "MSButtonProgressSlider.h"
#import "MSCharmView.h"
#import "MSCharmViewInternal.h"
#import "MSCommonProgressSlider.h"
#import "MSControlLayerAppearManagerDefines.h"
#import "MSControlLayerAppearStateManager.h"
#import "MSControlLayerDefines.h"
#import "MSControlLayerIdentifiers.h"
#import "MSControlLayerSwitcher.h"
#import "MSDeviceVolumeAndBrightness.h"
#import "MSDeviceVolumeAndBrightnessController.h"
#import "MSDeviceVolumeAndBrightnessControllerDefines.h"
#import "MSDeviceVolumeAndBrightnessTargetViewContext.h"
#import "MSDraggingObservation.h"
#import "MSDraggingObservationDefines.h"
#import "MSDraggingProgressPopupView.h"
#import "MSDraggingProgressPopupViewDefines.h"
#import "MSEdgeControlButtonItem.h"
#import "MSEdgeControlButtonItemAdapter.h"
#import "MSEdgeControlButtonItemAdapterLayout.h"
#import "MSEdgeControlButtonItemInternal.h"
#import "MSEdgeControlButtonItemView.h"
#import "MSEdgeControlLayer.h"
#import "MSEdgeControlLayerAdapters.h"
#import "MSExecuteCode.h"
#import "MSExecuteCodeLayerView.h"
#import "MSExecuteCodeLoader.h"
#import "MSFitOnScreenManager.h"
#import "MSFitOnScreenManagerDefines.h"
#import "MSFlipTransitionManager.h"
#import "MSFlipTransitionManagerDefines.h"
#import "MSFullscreenModeStatusBar.h"
#import "MSFullscreenModeStatusBarDefines.h"
#import "MSGestureControllerDefines.h"
#import "MSItemTags.h"
#import "MSLoadFailedControlLayer.h"
#import "MSLoadingView.h"
#import "MSLoadingViewDefines.h"
#import "MSMoreSettingControlLayer.h"
#import "MSMTPlaybackController.h"
#import "MSNotReachableControlLayer.h"
#import "MSPlaybackObservation.h"
#import "MSPlume.h"
#import "MSPlumeConfigurations.h"
#import "MSPlumeControlLayerProtocol.h"
#import "MSPlumeControlMaskView.h"
#import "MSPlumeHeader.h"
#import "MSPlumeLocalizedStringKeys.h"
#import "MSPlumeModel.h"
#import "MSPlumePlaybackControllerDefines.h"
#import "MSPlumePlayStatusDefines.h"
#import "MSPlumePresentView.h"
#import "MSPlumePresentViewDefines.h"
#import "MSPlumeRegistrar.h"
#import "MSPlumeResource+MSControlAdd.h"
#import "MSPlumeResource+MSResourcePlaybackAdd.h"
#import "MSPlumeResource+MSSubtitlesAdd.h"
#import "MSPlumeResource.h"
#import "MSPlumeResourceLoader.h"
#import "MSPlumeResourcePrefetcher.h"
#import "MSPlumeURLAsset.h"
#import "MSPlumeURLAssetPrefetcher.h"
#import "MSPresentationQueue.h"
#import "MSProgressSlider.h"
#import "MSQueue.h"
#import "MSReachability.h"
#import "MSReachabilityDefines.h"
#import "MSResourcePlaybackController.h"
#import "MSRotationDefines.h"
#import "MSRotationFullscreenNavigationController.h"
#import "MSRotationFullscreenViewController.h"
#import "MSRotationFullscreenWindow.h"
#import "MSRotationManager.h"
#import "MSRotationManagerDefines.h"
#import "MSRotationManagerInternal.h"
#import "MSRotationManager_iOS_16_Later.h"
#import "MSRotationManager_iOS_9_15.h"
#import "MSRotationObserver.h"
#import "MSRunLoopTaskQueue.h"
#import "MSScrollingTextMarqueeView.h"
#import "MSScrollingTextMarqueeViewDefines.h"
#import "MSSpeedupPlaybackPopupView.h"
#import "MSSpeedupPlaybackPopupViewDefines.h"
#import "MSSubtitleItem.h"
#import "MSSubtitlePopupController.h"
#import "MSSubtitlePopupControllerDefines.h"
#import "MSTaskQueue.h"
#import "MSTimerControl.h"
#import "MSUIKitAttributesDefines.h"
#import "MSUIKitTextMaker.h"
#import "MSUTAttributes.h"
#import "MSUTRangeHandler.h"
#import "MSUTRecorder.h"
#import "MSUTRegexHandler.h"
#import "MSUTUtils.h"
#import "MSViewControllerManager.h"
#import "MSViewControllerManagerDefines.h"
#import "NSAttributedString+MSMake.h"
#import "NSObject+MSObserverHelper.h"
#import "NSString+MSBornPlumeExtended.h"
#import "NSTimer+MSAssetAdd.h"
#import "UIView+MSAnimationAdded.h"
#import "UIView+MSBornPlumeExtended.h"
#import "UIViewController+MSBornPlumeExtended.h"

FOUNDATION_EXPORT double MSBornPlumeVersionNumber;
FOUNDATION_EXPORT const unsigned char MSBornPlumeVersionString[];

