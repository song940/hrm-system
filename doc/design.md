#页面设计文档

---

##人事管理

+ `导入` 可以导入Excel格式 , 支持单个或多个
+ `修改` 可修改 , 仅创建者可删除 , 其他人不可删除
+ `管理` 删除,修改权限 , 仅管理员可操作

- *所有操作记录留痕*
- *所有字段及类型参考数据库定义*

###添加(导入)新员工

- 添加员工信息 , 或从 Excel 导入单个或多个员工信息

###添加(管理)工作组

进入页面后显示 组织结构 图 , 可以:

- 添加工作组信息
- 删除工作组
- 修改工作组中的员工

###查询(管理)员工
根据员工信息中个字段定义查询员工信息

可以

- 删除员工信息
- 修改员工信息


##考勤管理
###添加(导入)考勤
添加或导入员工的考勤信息

数据结构通常是

- 员工名字或员工ID
- 考勤时间

###查询(修改)考勤

查询考勤信息

特殊原因下 比如考勤机坏了 , 无法考勤等情况 , 管理员可以

- 手动添加考勤
- 修改考勤信息

##绩效管理

绩效信息通常是 

`功绩/成绩` 表示以奖金形式的鼓励或惩罚
`效`  表示工作的效率

这两种数据构成绩效数据 , 绩效信息必须包含 `原因` 因为这个信息将在员工工资表中具体体现

另外需要注意的是 , 虽然这个叫做绩效管理 , 但是实际上这个功能是对员工工资的动态调整窗口 , 也就是说 , 凡是想对员工工资做调整的情况都需要在这里添加记录

比如 员工的纳税数据也需要在这里处理 , 

	刘松
	
	项目			金额		原因
	
	住房公积金	-300	-
	医疗保险		-200	-
	失业保险		-100	-
	加班费		+300	-

所以

###添加(导入)绩效
数据结构通常是

- 员工名字或员工ID
- 考勤数据`正数`或`负数`

###查询(修改)绩效
查询绩效信息

特殊原因 , 比如有异议的绩效 , 管理员可以修改绩效信息

##薪资管理
薪资管理数据由员工的`基本工资` 加上 `绩效信息` 中得数据自动计算得出 , 如果需要修改薪资可以修改员工的`基本薪资` 或者添加`绩效信息` `奖励`或`惩罚` 并填写理由

###查询薪资

查询某员工的薪资计算结果及构成 , 可以打印或导出员工工资表

##培训管理

###添加培训
参考数据定义

###查询(管理)培训
管理培训数据

##权限管理
用于控制用户登陆管理系统 , 需要注意 , 员工信息与用户管理的数据是分开的 , 也就是说添加的员工并不能直接登陆系统 , 如果需要某员工登陆系统需要用管理员创建用户信息并分配相应的权限才可以

*本单元必须登录并具有管理员权限才可以看到*
###添加用户
添加用户信息 , 并选择相关权限
###查询(管理)用户
查询用户数据 , 并修改用户权限
