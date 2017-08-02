// Generated by Apple Swift version 3.1 (swiftlang-802.0.53 clang-802.0.42)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIColor;
@class NSCoder;

SWIFT_CLASS("_TtC16NLSegmentControl16NLSegmentControl")
@interface NLSegmentControl : UIView
@property (nonatomic, copy) void (^ _Nullable indexChangedHandler)(NSInteger);
/// Edges inset edges of segments, default is 0 5 0 5
@property (nonatomic) UIEdgeInsets segmentEdgeInset;
/// Height of the selection indicator, default is 5.0
@property (nonatomic) CGFloat selectionIndicatorHeight;
/// Edge insets of the selection indicator. When selection indicator is .top, bottom edge insets are not used, when .bottom, top edge insets are not used. Default is .zero
@property (nonatomic) UIEdgeInsets selectionIndicatorEdgeInset;
/// Color of the selection indicator, default is .black
@property (nonatomic, strong) UIColor * _Nonnull selectionIndicatorColor;
/// Color of selection box, default is .clear
@property (nonatomic, strong) UIColor * _Nonnull selectionBoxColor;
/// Text attributes to apply to labels of the unselected segments
@property (nonatomic, copy) NSDictionary<NSString *, id> * _Nonnull titleTextAttributes;
/// Text attributes to apply to labels of the selected segments
@property (nonatomic, copy) NSDictionary<NSString *, id> * _Nonnull selectedTitleTextAttributes;
/// Vertical divider between the segments. Default is false
@property (nonatomic) BOOL enableVerticalDivider;
/// Color of vertical divider. Default is .gray
@property (nonatomic, strong) UIColor * _Nonnull verticalDividerColor;
/// Width of vertical divider. Default is 1.0f
@property (nonatomic) CGFloat verticalDividerWidth;
/// Inset top and bottom of vertical divider. Default is 15.0
@property (nonatomic) CGFloat verticalDividerInset;
/// space between image and title, default is 8.0
@property (nonatomic) CGFloat imageTitleSpace;
/// current selected index
@property (nonatomic, readonly) NSInteger selectedSegmentIndex;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)willMoveToSuperview:(UIView * _Nullable)newSuperview;
- (void)updateConstraints;
@end


@interface NLSegmentControl (SWIFT_EXTENSION(NLSegmentControl))
/// Changes the currently selected segment index.
/// \param index Index of the segment to select.
///
/// \param animated A boolean to specify whether the change should be animated or not
///
- (void)setSelectedSegmentIndex:(NSInteger)index animated:(BOOL)animated;
- (void)reloadSegments;
@end

@class UICollectionView;
@class UICollectionViewCell;

@interface NLSegmentControl (SWIFT_EXTENSION(NLSegmentControl)) <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end

@class UICollectionViewLayout;
@class UIScrollView;

@interface NLSegmentControl (SWIFT_EXTENSION(NLSegmentControl)) <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UIScrollViewDelegate>
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
@end


@interface NLSegmentControl (SWIFT_EXTENSION(NLSegmentControl))
@end


@interface UIButton (SWIFT_EXTENSION(NLSegmentControl))
@end


@interface UIImage (SWIFT_EXTENSION(NLSegmentControl))
@property (nonatomic, readonly, strong) UIImage * _Nullable segmentImage;
@end

@class NSLayoutConstraint;

@interface UIView (SWIFT_EXTENSION(NLSegmentControl))
- (NSLayoutConstraint * _Nonnull)nl_equalTopToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalLeftToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalBottomToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalRightToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalWidthToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalHeightToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalCenterXToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_equalCenterYToView:(UIView * _Nonnull)toView offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nonnull)nl_marginTopToView:(UIView * _Nonnull)toView margin:(CGFloat)margin;
- (NSLayoutConstraint * _Nonnull)nl_marginLeftToView:(UIView * _Nonnull)toView margin:(CGFloat)margin;
- (NSLayoutConstraint * _Nonnull)nl_marginBottomToView:(UIView * _Nonnull)toView margin:(CGFloat)margin;
- (NSLayoutConstraint * _Nonnull)nl_marginRightToView:(UIView * _Nonnull)toView margin:(CGFloat)margin;
- (NSLayoutConstraint * _Nonnull)nl_widthIs:(CGFloat)width;
- (NSLayoutConstraint * _Nonnull)nl_heightIs:(CGFloat)height;
- (NSLayoutConstraint * _Nonnull)nl_ratioIs:(CGFloat)ratio;
@end

#pragma clang diagnostic pop