<?php
/*
Title:              stJSONAPI - Tutorial Code
DESC:               Json api example
Auth:               Drew Lenhart - www.drewlenhart.com
Last Update:        02/08/15

Database info:
c_id = ID; c_cpu = CPU; c_mem = MEMORY; c_cdrive = c:\ DRIVE; c_date = TIMESTAMP
*/

require 'vendor/autoload.php';

$app = new \Slim\Slim();

$app->config(array(
	'templates.path' => './views'
	));

/*#### - MAIN - ####*/
$app->get('/', function() use($app) {
    $app->response->setStatus(200);
    echo "Welcome to my JSON API!<br /><br />";
    echo "View utilization <a href='/dashboard'>chart here</a>";
}); 

$app->get('/dashboard', function() use($app) {
    $app->render('dash.html');
}); 

/*
#### - GET CURRENT UTILIZATION/ALL NUMBERS - ####
e.g.
http://localhost/api/get/utilization = get all entries.
http://localhost/api/get/currentUtil = get current entry.
*/
$app->get('/api/get/:type', function($type) use($app) {
	
	$db = database::getInstance();
        
    try 
    {
        //use get $type from URL and use helper methods in database.class.php
        If ($type == 'utilization'){
            $sql = "SELECT * FROM c_utilization ORDER BY c_date ASC";
            $stmt = $db->getData($sql);
            
        }else if ($type == 'currentUtil'){
            $sql = "SELECT * FROM c_utilization ORDER BY c_date DESC";
            $stmt = $db->getDataSingle($sql);
            
        }else{
            echo "Incorrect parameter!  Please check url.";
            break;
        }

        if($stmt) {
            $app->response->setStatus(200);
            $app->response()->headers->set('Content-Type', 'application/json');
			$app->response()->headers->set('Access-Control-Allow-Origin', '*');
            echo json_encode($stmt);
            $db = null;
        } else {
            throw new PDOException('No records found.');
        }
 
    } catch(PDOException $e) {
        $app->response()->setStatus(404);
		$app->response()->headers->set('Access-Control-Allow-Origin', '*');
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }

});

/*
#### - INSERT CURRENT UTILIZATION NUMBERS - ####
e.g.
http://localhost/api/insertUtil = insert entry.
*/

$app->post('/api/insertUtil', function() use($app) {
    $posts = $app->request->post();
    $cpu = $posts['cpu'];
    $mem = $posts['mem'];
    $disk = $posts['disk'];
    
    $db = database::getInstance();
    
    try 
    {
         $data = array(
            ':cpu' => $cpu,
            ':mem' => $mem,
            ':cdrive' => $disk);
            
        $sql= 'INSERT INTO c_utilization (c_cpu, c_mem, c_cdrive) VALUES (:cpu,:mem,:cdrive)';

        //use helper methods in includes/database.class.php
        $db->insertData($sql, $data);
 
        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        $app->response()->headers->set('Access-Control-Allow-Origin', '*');
        echo json_encode(array("status" => "success", "code" => 1));
        //close connection
        $db->closeConn();
 
    } catch(PDOException $e) {
        $app->response()->setStatus(404);
        $app->response()->headers->set('Access-Control-Allow-Origin', '*');
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
    
    
});

//RUN!!
$app->run();

?>