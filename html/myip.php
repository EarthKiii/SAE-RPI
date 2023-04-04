<html>
  <head>
    <title>👀</title>
    <style>
      html,
      body {
        height: 100%;
        width: 100%;
        display: flex;
        font-family: Verdana, sans-serif;
      }
  
      body {
        justify-content: center;
        align-items: center;
        flex-direction: column;
      }
    </style>
  </head>
    <body>
      <?php
$client_ip = $_SERVER['HTTP_CLIENT_IP']
        ? : ($_SERVER['HTTP_X_FORWARDED_FOR']
        ? : $_SERVER['REMOTE_ADDR']);
echo "<h1>I see you : $client_ip</h1>";
      ?>
  </body>
</html>

