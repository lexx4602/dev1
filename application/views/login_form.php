<?php $this->load->view('includes/header'); ?>

<div id="login_form">

    <h1>Login</h1>
    <?php
    echo form_open('login/validate_credentials');
    echo form_input('username','Username');
    echo form_password('password','Password');
    echo form_submit('submint','Login');
    echo anchor('login/signup','Create Account');
    ?>
</div>

<?php $this->load->view('includes/tut_info'); ?>

<?php $this->load->view('includes/footer'); ?>