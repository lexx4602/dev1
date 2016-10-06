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


nav {
	display: block;
}
ul {
	list-style: none;
	margin: 5px;
	padding: 5px;
}
a {
	text-decoration: none;
	outline: none;
}
.topmenu {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	position: relative;
	background: rgba(255,255,255,.8);
}
.topmenu:before, .topmenu:after {
	content: "";
	display: table;
	clear: both;
}
.topmenu li {
	display: inline-block;
	position: relative;
	border: 1px solid #003559;
}
.link {
	font-family: 'Exo 2', sans-serif;
	display: block;
	height: 70px;
	line-height: 70px;
	padding: 0 30px;
	font-weight: bold;
	color: #003559;
	text-transform: uppercase;
	-webkit-transition: color 0.4s ease-in-out;
	-moz-transition: color 0.4s ease-in-out;
	-o-transition: color 0.4s ease-in-out;
	transition: color 0.4s ease-in-out;
}
.down:after {
	content:"\f107";
	margin-left: 8px;
	font-family: FontAwesome;
}
.link:hover {
	color: #E6855F;
}
.submenu {
	background: white;
	border: 2px solid #003559;
	position: absolute;
	left: 0;
	visibility: hidden;
	opacity: 0;
	z-index: 10;
	width: 150px;
	-webkit-transform: perspective(600px) rotateX(-90deg);
	-moz-transform: perspective(600px) rotateX(-90deg);
	-ms-transform: perspective(600px) rotateX(-90deg);
	transform: perspective(600px) rotateX(-90deg);
	-webkit-transform-origin: 0% 0%;
	-moz-transform-origin: 0% 0%;
	-ms-transform-origin: 0% 0%;
	transform-origin: 0% 0%;
	-webkit-transition: color 0.4s ease-in-out;
	-moz-transition: color 0.4s ease-in-out;
	-o-transition: color 0.4s ease-in-out;
	transition: 0.6s ease-in-out;
}
.submenu > li {
	display: block;
}
.topmenu li:hover > .submenu{
	visibility: visible;
	opacity: 1;
	-webkit-transform: perspective(600px) rotateX(0deg);
	-moz-transform: perspective(600px) rotateX(0deg);
	-ms-transform: perspective(600px) rotateX(0deg);
	transform: perspective(600px) rotateX(0deg);
}
.submenu li a {
	display: block;
	color: #7f7f7f;
	font-size: 13px;
	line-height: 36px;
	padding: 0 2px;
	font-family: 'Kurale', serif;
}
.submenu li a:hover {
	color: #E6855F;
}



</style>
</head>
<body>


	<div>
		<div style="position: absolute; z-index:999;">
			<nav>
			<ul class="topmenu" >
				<li style="width: 150px">Справочники
				<ul class="submenu">
					<li><a href='<?php echo site_url('Lists/domains')?>'>Домены</a></li>
					<li><a href='<?php echo site_url('Lists/zones')?>'>Зоны</a></li>
					<li><a href='<?php echo site_url('Lists/dnsreg')?>'>Регистраторы</a></li>
					<li><a href='<?php echo site_url('Lists/ipaddress')?>'>IP Адреса</a></li>
					<li><a href='<?php echo site_url('Lists/os')?>'>операционные системы</a></li>
					<li><a href='<?php echo site_url('Lists/srvstatus')?>'>Статус Серверов</a></li>
					<li><a href='<?php echo site_url('Lists/taskstatus')?>'>Статус задач</a></li>
					<li><a href='<?php echo site_url('Lists/demons')?>'>Приложения</a> </li>
					<li><a href='<?php echo site_url('Lists/groups')?>'>Группы</a> </li>
					<li><a href='<?php echo site_url('Lists/ports')?>'>Порты</a> </li>
					<li><a href='<?php echo site_url('Lists/acltype')?>'>Типы доступа</a> </li>


				</ul></li>
				<li style="width: 150px"><a href='<?php echo site_url('Servers/systems')?>'>Система</a>
				<ul class="submenu">
						<li><a href='<?php echo site_url('Servers/services')?>'>Сервисы</a></li>
						<li><a href='<?php echo site_url('Servers/hosts')?>'>Хосты</a></li>
						<li><a href='<?php echo site_url('Servers/manage')?>'>Сервера</a></li>
						<li><a href='<?php echo site_url('Servers/projects')?>'>Проекты</a></li>
						<li><a href='<?php echo site_url('Servers/users')?>'>Пользователи</a></li>
				</ul >
				</li>
				<li style="width: 150px">Работы
				<ul class="submenu">
					<li><a href='<?php echo site_url('Works/workdata')?>'>Работа с серверами</a></li>
					<li><a href='<?php echo site_url('Works/troubles')?>'>Проблемы</a></li>
				</ul></li>
				<li style="width: 150px">Администрирование
					<ul class="submenu">
						<li><a href='<?php echo site_url('Admins/roles')?>'>Роли</a></li>
						<li><a href='<?php echo site_url('Admins/users')?>'>Пользователи</a></li>
						<li><a href='<?php echo site_url('Admins/groups')?>'>Группы</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>

	</div>
	<div style='height:20px;'></div>  
    <div>
		<?php
		echo "<p align='right'>";
			echo $username = $this->session->userdata('username');
			echo ' : <a href="/Login/logout">logout</a>';
		echo "</P>";
		?>
		<?php echo $output; ?>
    </div>
</body>
</html>
