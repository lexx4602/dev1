<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<?php 
foreach($css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
<style type='text/css'>
body
{
	font-family: Arial;
	font-size: 14px;
}
a {
    color: blue;
    text-decoration: none;
    font-size: 14px;
}
a:hover
{
	text-decoration: underline;
}
#navbar ul {
	display: none;
	background-color: #eef6ff;
	position: absolute;
	top: 100%;
}
#navbar li:hover ul { display: block; }
#navbar, #navbar ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
#navbar {
	height: 30px;
	background-color: #eaebff;
	padding-left: 75px;
	min-width: 470px;
}
#navbar li {
	float: left;
	position: relative;
	height: 100%;
}
#navbar li a {
	display: block;
	padding: 6px;
	width: 100px;
	color: #000000;
	text-decoration: none;
	text-align: center;
}
#navbar ul li { float: none; }
#navbar li:hover { background-color: #eaebff; }
#navbar ul li:hover { background-color: #d3d6ff; }
</style>
</head>
<body>
	<div>
		<div style="position: absolute; z-index:999;">
			<ul id="navbar" >
				<li style="width: 120px">Справочники
				<ul>
					<li><a href='<?php echo site_url('/Servers/domains')?>'>Домены</a></li>
					<li><a href='<?php echo site_url('/Servers/zones')?>'>Зоны</a></li>
					<li><a href='<?php echo site_url('/Servers/dnsreg')?>'>Регистраторы</a></li>
					<li><a href='<?php echo site_url('/Servers/ipaddress')?>'>IP Адреса</a></li>
					<li><a href='<?php echo site_url('Servers/os')?>'>операционные системы</a></li>
					<li><a href='<?php echo site_url('Servers/srvstatus')?>'>Статус Серверов</a></li>
					<li><a href='<?php echo site_url('Servers/taskstatus')?>'>Статус задач</a></li>
					<li><a href='<?php echo site_url('Servers/demons')?>'>Приложения</a> </li>
					<li><a href='<?php echo site_url('Servers/os')?>'>операционные системы</a></li>
				</ul></li>
				<li style="width: 120px">Система
				<ul >
						<li><a href='<?php echo site_url('/Servers/services')?>'>Сервисы</a></li>
						<li><a href='<?php echo site_url('/Servers/hosts')?>'>Хосты</a></li>
						<li><a href='<?php echo site_url('/Servers/manage')?>'>Сервера</a></li>
						<li><a href='<?php echo site_url('Servers/projects')?>'>Проекты</a></li>
						<li><a href='<?php echo site_url('Servers/users')?>'>Пользователи</a></li>
				</ul >
				</li>
				<li style="width: 120px">Работы
				<ul >
					<li><a href='<?php echo site_url('Servers/srvstatus')?>'>Статус Серверов</a></li>
					<li><a href='<?php echo site_url('Servers/troubles')?>'>Проблемы</a></li>
				</ul></li>
			</ul>
		</div>


<!--		<a href='<?php echo site_url('/Servers/services')?>'>Сервисы</a> | -->
<!--		<a href='<?php echo site_url('/Servers/domains')?>'>Домены</a> |  -->
<!--		<a href='<?php echo site_url('/Servers/hosts')?>'>Хосты</a> | -->
<!--		<a href='<?php echo site_url('/Servers/dnsreg')?>'>Регистраторы</a> | -->
<!--		<a href='<?php echo site_url('/Servers/zones')?>'>Зоны</a> | -->
<!--		<a href='<?php echo site_url('/Servers/ipaddress')?>'>IP Адреса</a> | -->
<!--		<a href='<?php echo site_url('/Servers/manage')?>'>Сервера</a> | -->
<!--		<a href='<?php echo site_url('Servers/users')?>'>Пользователи</a> | -->
<!--		<a href='<?php echo site_url('Servers/projects')?>'>Проекты</a> | -->
<!--		<a href='<?php echo site_url('Servers/os')?>'>операционные системы</a> | -->
<!--		<a href='<?php echo site_url('Servers/troubles')?>'>Проблемы</a> | -->
<!--		<a href='<?php echo site_url('Servers/srvstatus')?>'>Статус Серверов</a> | -->
<!--		<a href='<?php echo site_url('Servers/demons')?>'>Приложения</a> | -->
<!--		<a href='<?php echo site_url('Servers/taskstatus')?>'>Статус задач</a> | -->
<!--		<a href='<?php echo site_url('Servers/workdata')?>'>Работа с серверами</a> -->
	</div>
	<div style='height:20px;'></div>  
    <div>
		<?php echo $output; ?>
    </div>




</body>
</html>
