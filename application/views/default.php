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
</style>
</head>
<body>
	<div>
		<a href='<?php echo site_url('/Servers/services')?>'>Сервисы</a> |
		<a href='<?php echo site_url('/Servers/domains')?>'>Домены</a> |
		<a href='<?php echo site_url('/Servers/hosts')?>'>Хосты</a> |
		<a href='<?php echo site_url('/Servers/dnsreg')?>'>Регистраторы</a> |
		<a href='<?php echo site_url('/Servers/zones')?>'>Зоны</a> |
		<a href='<?php echo site_url('/Servers/ipaddress')?>'>IP Адреса</a> |
		<a href='<?php echo site_url('/Servers/manage')?>'>Сервера</a> |
		<a href='<?php echo site_url('Servers/users')?>'>Пользователи</a> |
		<a href='<?php echo site_url('Servers/projects')?>'>Проекты</a> |
		<a href='<?php echo site_url('Servers/os')?>'>операционные системы</a> |
		<a href='<?php echo site_url('Servers/troubles')?>'>Проблемы</a> |
		<a href='<?php echo site_url('Servers/srvstatus')?>'>Статус Серверов</a> |
		<a href='<?php echo site_url('Servers/demons')?>'>Приложения</a> |
		<a href='<?php echo site_url('Servers/taskstatus')?>'>Статус задач</a> |
		<a href='<?php echo site_url('Servers/workdata')?>'>Работа с серверами</a>
	</div>
	<div style='height:20px;'></div>  
    <div>
		<?php echo $output; ?>
    </div>




</body>
</html>
