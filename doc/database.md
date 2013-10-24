人事管理系统 设计文档
==========

概述
-------------


---

##人事管理
主要涉及人员变动以及人员的资料管理等信息.


员工的基本信息应该包括以下内容:

<table width="100%">
	<caption>Employee 人员信息表</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>人员索引</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>name</td>
		<td>姓名</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>gender</td>
		<td>性别</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>birthday</td>
		<td>出生日期</td>
	</tr>
	
	<tr>
		<td>String</td>
		<td>passport</td>
		<td>身份证号码</td>
	</tr>
</table>

根据人员信息表中的记录可以关联工作经验表

<table width="100%">
	<caption>WorkExpress 工作经验</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>关联员工索引</td>
	</tr>
	<tr>
		<td>String</td>
		<td>company</td>
		<td>就职单位</td>
	</tr>
		<tr>
		<td>String</td>
		<td>title</td>
		<td>职称</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>from</td>
		<td>从何时</td>
	</tr>
	
	<tr>
		<td>Date</td>
		<td>to</td>
		<td>到何日</td>
	</tr>
		<tr>
		<td>String</td>
		<td>reason</td>
		<td>何故</td>
	</tr>
</table>


<table width="100%">
	<caption>Education 教育情况</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>关联员工索引</td>
	</tr>
	
	<tr>
		<td>String</td>
		<td>level</td>
		<td>教育水平</td>
	</tr>
	<tr>
		<td>String</td>
		<td>institution</td>
		<td>院校</td>
	</tr>
	<tr>
		<td>String</td>
		<td>discipline</td>
		<td>专业</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>from</td>
		<td>从何时</td>
	</tr>
	
	<tr>
		<td>Date</td>
		<td>to</td>
		<td>到何日</td>
	</tr>
</table>

根据以上数据表可以生成一张简历表并打印



<table width="100%">
	<caption>Group 描述</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>group_id</td>
		<td>隶属组</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>name</td>
		<td>项目组名称</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>负责人</td>
	</tr>
</table>

通过项目组定义 , 可以创建组织结构图

<table width="100%">
	<caption>job 员工职位描述</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
		<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>关联员工索引</td>
	</tr>
	
	<tr>
		<td>Integer</td>
		<td>group_id</td>
		<td>隶属组</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>title</td>
		<td>职称</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>salary</td>
		<td>基本薪资(不含绩效)</td>
	</tr>
	<tr>
		<td>Integer</td>
		<td>status</td>
		<td>合同状态</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>from</td>
		<td>合同开始日期</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>to</td>
		<td>合同结束日期</td>
	</tr>
</table>

##考勤管理
主要控制员工的迟到早退情况 , 系统可以在指定日期(如:月末或结算工资前一天) 计算员工的迟到早退情况 , 将数据反映到绩效管理 , 生成记录 . 


<table width="100%">
	<caption>员工考勤信息</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
		<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>关联员工索引</td>
	</tr>
	
	<tr>
		<td>Date</td>
		<td>check_in</td>
		<td>签到时间</td>
	</tr>
	<tr>
		<td>Date</td>
		<td>check_out</td>
		<td>下班时间</td>
	</tr>
</table>

定义 , `早8:00 - 晚6:00` , 即 `8:00 ~ 18:00` 为标准 , 可以适当考虑 `容忍值` 比如:  可以 `迟到5分钟以内` , 那么系统就可以通过过滤考勤表中的 

	check_in > 8:05 or check_out < 18:00 
	
获取出迟到早退的员工 .

	刘松
	
	2012-05-06		迟到		10分钟
	2012-05-06		早退		5分钟
	

	

##绩效管理

通过绩效考核的加减薪资权重可以根据员工的实际工作情况动态调整薪资 . 



<table width="100%">
	<caption>绩效管理</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
		<tr>
		<td>Integer</td>
		<td>employee_id</td>
		<td>关联员工索引</td>
	</tr>
	
	<tr>
		<td>Integer</td>
		<td>number</td>
		<td>绩效(+/-)</td>
	</tr>
	<tr>
		<td>String</td>
		<td>reason</td>
		<td>理由</td>
	</tr>
</table>

根据上表中的定义 , 我们可以得到以下:

	刘松		-10		迟到
	刘松		+50		加班
	刘松		-500	社保
	刘松		+50		餐费

	
通过对绩效得计算得出 `绩效工资` 还以上面的例子为例是 `40` 那么 `基本工资` + `绩效` = `实际工资`

##薪资管理
根据员工信息的 [job 员工职位描述] 表中的 *基本薪资* 项目, 加上绩效管理中的综合平定结果


<table width="100%">
	<caption>工资详情</caption>
	<thead>
		<tr>
			<td>姓名</td>
			<td>Lsong</td>
			<td>2013-06-06</td>
		</tr>
	</thead>
	<tr>
		<td>基本工资</td>
		<td colspan="2" >15,000</td>
	</tr>
	<tr>
		<td></td>
		<td>绩效工资</td>
		<td></td>
	</tr>
		<tr>
		<td>1</td>
		<td>+200</td>
		<td>理由</td>
	</tr>
	<tr>
		<td>2</td>
		<td>+200</td>
		<td>理由</td>
	</tr>
		<tr>
		<td>3</td>
		<td>-100</td>
		<td>理由</td>
	</tr>
	<tr>
		<td>4</td>
		<td>-200</td>
		<td>理由</td>
	</tr>
	</tr>
	<tr>
		<td></td>
		<td> &nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td>合计:</td>
		<td>CNY: 2000</td>
		<td>出纳:刘松</td>
	</tr>
</table>

*该功能模块需要有打印功能

##培训管理



<table width="100%">
	<caption>培训</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
	<tr>
		<td>String</td>
		<td>name</td>
		<td>培训项目</td>
	</tr>
	
	<tr>
		<td>String</td>
		<td>keynote</td>
		<td>大致内容</td>
	</tr>
	<tr>
		<td>String</td>
		<td>date</td>
		<td>时间</td>
	</tr>
	<tr>
		<td>String</td>
		<td>length</td>
		<td>时长(45min)</td>
	</tr>
	
	<tr>
		<td>String</td>
		<td>address</td>
		<td>地点(5F会议室)</td>
	</tr>
	
	<tr>
		<td>Boolean</td>
		<td>must</td>
		<td>是否为必须参加?</td>
	</tr>
</table>

##权限管理




<table width="100%">
	<caption>User 用户</caption>
	<thead>
		<tr>
			<td>Type</td>
			<td>字段名称</td>
			<td>描述</td>
		</tr>
	</thead>
	<tr>
		<td>Integer</td>
		<td>id</td>
		<td>索引</td>
	</tr>
	<tr>
		<td>String</td>
		<td>name</td>
		<td>名称</td>
	</tr>
	<tr>
		<td>String</td>
		<td>email</td>
		<td>电子邮件</td>
	</tr>
	
	<tr>
		<td>String</td>
		<td>password</td>
		<td>密码</td>
	</tr>
	<tr>
		<td>Boolean</td>
		<td>admin</td>
		<td>是否为管理员</td>
	</tr>
</table>