//
//  PersonalMakeViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/25.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalMakeViewController.h"
#import "PersonalUnPhoneViewController.h"
#import "PersonalNameController.h"

@interface PersonalMakeViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate,UITextFieldDelegate,UIAlertViewDelegate,ChangeDelegate>

@property(nonatomic)UITableView *tableView;

@property(nonatomic)NSArray *array;

@property(nonatomic)UIImageView *icon;
//弹出性别的view
@property(nonatomic)UIView *sexView;
//sexLabel
@property(nonatomic)UILabel *sexLabel;
//titleLabel 请选择性别
@property(nonatomic)UILabel *titlelabel;
//男
@property(nonatomic)UIButton *manBtn;
//女
@property(nonatomic)UIButton *womanBtn;
//姓名的textfield
@property(nonatomic)UILabel *nameLabel;

@end

@implementation PersonalMakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改资料";
    self.view.backgroundColor = [UIColor whiteColor];
   _array = @[@[@"头像",@"昵称",@"性别"],@[@"解绑手机"]];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    //限制namefield 输入字符的个数
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fieldDidChange) name:UITextFieldTextDidChangeNotification object:self.nameLabel];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupui];
}

//限制namefield 输入字符的个数
//-(void)fieldDidChange
//{
//    if (self.nameLabel.text.length > 4) {
//        self.nameLabel.text = [self.nameLabel.text substringWithRange:NSMakeRange(0, 4)];
//    }
//}

#pragma mark - ui
-(void)setupui
{
    //选择性别  弹出的view
    _sexView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 384 *SCREEN_HEIGHT/1136)];
    _sexView.backgroundColor = Gray_Color;
    [self.view addSubview:_sexView];
    
    //遮盖文字的view
    UIView *alview = [[UIView alloc]initWithFrame:CGRectMake(0, 120 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 68 *SCREEN_HEIGHT/1136)];
    alview.backgroundColor = [UIColor whiteColor];
    alview.alpha = 0.5;
    [_sexView addSubview:alview];
    
    _titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(254 *SCREEN_WIDTH/650, 120 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 68 *SCREEN_HEIGHT/1136)];
    _titlelabel.textColor = BLUE_Color;
    _titlelabel.text = @"请选择性别";
//    _titlelabel.textAlignment = NSTextAlignmentCenter;
    [_sexView addSubview:_titlelabel];
    
    _manBtn = [[UIButton alloc]initWithFrame:CGRectMake(315 *SCREEN_WIDTH/650,188 *SCREEN_HEIGHT/1136, 18, 68 *SCREEN_HEIGHT/1136)];
    [_manBtn setTitle:@"男" forState:UIControlStateNormal];
    [_manBtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside
     ];
    _manBtn.tag = 1;
    [_manBtn setTitleColor:Black_Color forState:UIControlStateNormal];
    _manBtn.titleLabel.textColor = [UIColor blackColor];
    [_sexView addSubview:_manBtn];

    _womanBtn = [[UIButton alloc]initWithFrame:CGRectMake(315 *SCREEN_WIDTH/650, 256 *SCREEN_HEIGHT/1136, 18, 68 *SCREEN_HEIGHT/1136)];
    [_womanBtn setTitle:@"女" forState:UIControlStateNormal];
    [_womanBtn setTitleColor:Black_Color forState:UIControlStateNormal];
    [_womanBtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    _womanBtn.tag = 2;
    [_sexView addSubview:_womanBtn];
}
#pragma mark - 性别 选择
-(void)didClick:(UIButton *)btn
{
    if (btn.tag==1) {
        _sexLabel.text = @"男";
    }else
    {
        _sexLabel.text = @"女";
    }
    [UIView animateWithDuration:0.2f animations:^{
        _sexView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 384 *SCREEN_HEIGHT/1136);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.array.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.array[section];
    return arr.count;
}

#pragma mark - 每行cell 显示的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textColor = Black_Color;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15 , 90*SCREEN_HEIGHT/1334-1, 8, 15)];
    imageView.image = [UIImage imageNamed:@"arrow-right"];
    imageView.center = CGPointMake(SCREEN_WIDTH-21, cell.contentView.center.y);
    [cell.contentView addSubview:imageView];
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 26 *SCREEN_HEIGHT/1136, 22, 22)];
        _icon.image = [UIImage imageNamed:@"modified-data-img"];
        _icon.layer.cornerRadius = 12;
        _icon.clipsToBounds = YES;
        _icon.userInteractionEnabled = YES;
        [cell.contentView addSubview:_icon];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonpress)];
        UIImage *image = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] valueForKey:@"icon_image"] scale:1];
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"icon_image"]) {
            [self.icon setImage:image];
        }else
        {
            _icon.image = [UIImage imageNamed:@"member-img"];
        }

        [_icon addGestureRecognizer:tap];
        
        
    }else if (indexPath.row == 1 && indexPath.section == 0)
    {
        
      _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 95, 1, SCREEN_WIDTH, 88 *SCREEN_HEIGHT/1136)];
        _nameLabel.text = @"SSSS-111";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = Black_Color;
        
//        _nameLabel.delegate = self;
        //弹出的键盘带有 完成按钮
//        _nameField.returnKeyType =  UIReturnKeyDone;
//        UIImageView *imageBtn = [[UIImageView alloc]initWithFrame:CGRectMake(15 , 90*SCREEN_HEIGHT/1334-1, 15, 15)];
//        imageBtn.image = [UIImage imageNamed:@"member-name"];
//        imageBtn.center = CGPointMake(SCREEN_WIDTH-21, cell.contentView.center.y);
//        [cell.contentView addSubview:imageBtn];
        [cell.contentView addSubview:_nameLabel];
    }else if (indexPath.row == 2 && indexPath.section == 0)
    {
        _sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 0, SCREEN_WIDTH, 88 *SCREEN_HEIGHT/1136)];
        _sexLabel.text = @"女";
        _sexLabel.textColor = Label_Color;
        [cell.contentView addSubview:_sexLabel];
    }
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == 1) {
//        PersonalNameController  *name = [[PersonalNameController alloc]init];
//        [self.navigationController pushViewController:name animated:YES];
//    }
//}

//弹出键盘内 有完成按钮
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    UIImageView *successView = [[UIImageView alloc]initWithFrame:CGRectMake(187 *SCREEN_WIDTH/650, 386 *SCREEN_HEIGHT/1136, 260 *SCREEN_WIDTH/650, 240 *SCREEN_HEIGHT/1136)];
//    successView.image = [UIImage imageNamed:@"collect-success-bg"];
//    [self.view addSubview:successView];
//    UIImageView *success = [[UIImageView alloc]initWithFrame:CGRectMake(127 *SCREEN_WIDTH/650, 100 *SCREEN_HEIGHT/1136, 37, 35)];
//    
//    [successView addSubview:success];
//    [textField resignFirstResponder];
//    return YES;
//}


#pragma mark - 调用相机的方法
-(void)buttonpress
{
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"请选择方式" message:@"请选择" preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
    }]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"从相册中" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
        UIImagePickerController *image= [[UIImagePickerController alloc]init];
        image.delegate = self;
        image.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
        //允许让用户编辑
        image.allowsEditing = YES;
        if ([self.delegate respondsToSelector:@selector(presentViewController:andPersonalMakeViewController:)]) {
            [self.delegate presentViewController:image andPersonalMakeViewController:self];
        }
    }]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"打开相机");
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
            if ([self.delegate respondsToSelector:@selector(presentViewController:andPersonalMakeViewController:)]) {
                [self.delegate presentViewController:picker andPersonalMakeViewController:self];
            }
        }else
        {
            NSLog(@"模拟器中无法打开相机");
        }
    }]];
    if ([self.delegate respondsToSelector:@selector(presentViewController:andPersonalMakeViewController:)]) {
        [self.delegate presentViewController:sheet andPersonalMakeViewController:self];
    }
}
#pragma mark - 选择完成图片后调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.icon.image = info[UIImagePickerControllerOriginalImage];
//  self.icon.cornerRadius = 25;
    self.icon.layer.masksToBounds = YES;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeUserImage" object:nil userInfo:@{@"image":info[UIImagePickerControllerOriginalImage]}];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
            case 0:
        {
            switch (indexPath.row) {
                    case 1:
                {
                    PersonalNameController  *PersonalName = [[PersonalNameController alloc]init];
                    PersonalName.name = _nameLabel.text;
                    PersonalName.delegate = self;
                    NSLog(@"%@",PersonalName.name);
//
                    [self.navigationController pushViewController:PersonalName animated:YES];
                }
                     break;
                     
                case 2:
                {
                    [UIView animateWithDuration:0.2f animations:^{
                        _sexView.frame = CGRectMake(0, SCREEN_HEIGHT- 384 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 384 *SCREEN_HEIGHT/1136);
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            PersonalUnPhoneViewController *un = [[PersonalUnPhoneViewController alloc]init];
            [self.navigationController pushViewController:un animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.view endEditing:YES];
    [UIView animateWithDuration:0.2f animations:^{
        _sexView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 384 *SCREEN_HEIGHT/1136);
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return  88 *SCREEN_HEIGHT/1136;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(void)saveChangeData:(NSString *)string
{
    _nameLabel.text = string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
