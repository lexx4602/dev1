<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
#	public function index()
#	{
#		$this->load->view('welcome_message');
#	}
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
        $this->load->library('grocery_CRUD');
        $this->is_logged_in();
    }

    function is_logged_in()
    {
        $is_logged_in = $this->session->userdata('is_logged_in');
        if (!isset($is_logged_in) || $is_logged_in != true) {
          #  echo 'You don\'t have permission to access this page. <a href="/login">Login</a>';
           redirect('/login');
            die();
            //$this->load->view('login_form');
        }
    }

    public function view_output($output = null)
    {
        $this->load->view('default.php', $output);
    }

    public function index()
    {

        $output =' 
 <div style="align-content:center;">
 <table border="0"> <tr>
<td><a href="/Servers/systems"><img src="">Сиситемы</a></td>
<td><a href="/Servers/projects"><img src="">Проекты</a></td>
<td><a href="/Servers/services"><img src="">Сервисы</a></td>
</tr> <tr>
<td><a href="/Servers/servers"><img src="">Сервера</a></td>
<td><a href="/Works/workdata"><img src="">Работы</a></td>
<td><a href="/Works/troubles"><img src="">Проблемы</a></td>
</tr> <tr>
<td><a href="/Admins/users"><img src="">Пользователи</a></td>
<td><a href="/Admins/groups"><img src="">Группы</a></td>
<td><a href="/Lists"><img src="">Справочники</a></td>
</tr> </table> </div>';
        $this->view_output((object)array('output' => $output, 'js_files' => array(), 'css_files' => array()));
    }


}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */