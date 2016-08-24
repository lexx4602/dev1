<?php
/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 16.08.2016
 * Time: 16:14
 */

function Add_LDAP ($user)
{
    $ldap_host = 'localhost';
    $base_dn = 'CN='.$user->user_name.',DC=regiac,DC=org';
    $GLOBALS['log']->fatal($base_dn);
    //Preparamos el usuario para crearlo
    $info["givenName"]=$user->first_name;
    $info["sn"]=$user->last_name;
    $info["uid"]=$user->user_name;
    $info["homeDirectory"]="/home/";
    $info["mail"]=$user->email1;
    $info["displayName"]= $user->first_name." ".$user->last_name;
    $info["departmentNumber"]=$user->id;
    $info["cn"] =$user->user_name;
    $info["userPassword"]=$user->user_hash;
    $info["objectclass"][0] = "top";
    $info["objectclass"][1] = "person";
    $info["objectclass"][2] = "inetOrgPerson";
    $info["objectclass"][3] = "organizationalPerson";



    $ldap_user  = "CN=admin,DC=regiac,DC=org";
    $ldap_pass = "passw";

    //First: Connect to  LDAP Server
    $connect = ldap_connect( $ldap_host, $ldap_port)
    or $GLOBALS['log']->fatal(">>Could not connect to LDAP server to add user<<");
    ldap_set_option($connect, LDAP_OPT_PROTOCOL_VERSION, 3);
    ldap_set_option($connect, LDAP_OPT_REFERRALS, 0);

//Login to LDAP
    $bind = ldap_bind($connect, $ldap_user, $ldap_pass)
    or $GLOBALS['log']->fatal(">>Could not bind to $ldap_host to add user<<");

// Adding new user - Here it is where it fails

    $add = ldap_add($connect, $base_dn, $info)
    or $GLOBALS['log']->fatal(">>Not able to load user <<");

// Close connection
    ldap_close($connect);

    // Return value of operation

    return $add;




}