//
//  ScenesTvc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 2/8/14.
//
//

#import "ScenesTvc_iPhone.h"

enum {
  kRowEspn,
  kRowNcaa,
  kRowBiz,
  kRowNews1,
  kRowNews2,
  kRowNfl
};

@implementation ScenesTvc_iPhone {
  NSArray *_rows;
}

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    self.navigationItem.title = @"Scenes";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                               initWithTitle:@"Close"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(handleClose:)];
    _rows = @[
        @(kRowEspn),
        @(kRowNcaa),
        @(kRowBiz),
        @(kRowNews1),
        @(kRowNews2),
        @(kRowNfl)
    ];
  }
  return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
  }

  NSString *text;
  NSString *subText;
  switch ([_rows[indexPath.row] integerValue]) {
    case kRowEspn:
      text = @"ESPN";
      subText = @"ESPN 2 | ESPN | ESPN U";
      break;
    case kRowNcaa:
      text = @"NCAA";
      subText = @"CBS Sports | CBS | NBC Sports";
      break;
    case kRowBiz:
      text = @"Biz";
      subText = @"HLN | CNBC | Fox Business";
      break;
    case kRowNews1:
      text = @"News 1";
      subText = @"Weather | HLN | ESPNews";
      break;
    case kRowNews2:
      text = @"News 2";
      subText = @"MSNBC | Fox | CNN";
      break;
    case kRowNfl:
      text = @"NFL";
      subText = @"CBS | Fox | NFL Sunday Ticket";
      break;
    default:
      text = @"";
      subText = @"";
      break;
  }
  cell.textLabel.text = text;
  cell.detailTextLabel.text = subText;
  return cell;
}

#pragma mark - Actions

- (void)handleClose:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
