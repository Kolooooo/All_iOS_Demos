

#import <UIKit/UIKit.h>

@interface UITableViewCell (__Category)

/**
 去掉UITableView中的某cell条分割线
 
 @param indexPath indexPath
 @param section section
 @param row row
 */
- (void)__removeBottomLineWithIndexPath:(NSIndexPath *_Nonnull)indexPath
                                section:(NSInteger)section
                                    row:(NSInteger)row;

/**
 获取cell 的上级UITableView 视图
 
 @return 返回上级UITableView 视图
 */
/**
 To answer the question, Apple does not provide a public API for that and you would have to do it using what is known about view hierarchies. A tableViewCell would always be part of a tableView. Technically, a tableViewCell would always be in a tableView's view hierarchy or a tableViewCell would always have some superview out there that is a tableView. Here is a method similar to this one:
 
 More generally, Apple did not provide such public API for a reason. It is indeed best practice for the cell to use other mechanisms to avoid querying the tableView, like using properties that can be configured at runtime by the user of the class in tableView:cellForRowAtIndexPath:.
 */
- (UITableView *_Nullable)__getParentTableView;

@end
