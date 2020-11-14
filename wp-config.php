<?php
// ** MySQL settings - You can get this info from your web host ** //


define( 'DB_NAME', 'wp_db' );
define( 'DB_USER', 'wp_user' );
define( 'DB_PASSWORD', '123' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


 /* Authentication Unique Keys and Salts. */
define('AUTH_KEY',         '2LT{0*S4#<R.^%ha}C&ri-UY=ruuE6|6g4E!HR,x>|[A+^+zDYM_+a@keZANH]qE');
define('SECURE_AUTH_KEY',  ';Y+#_NWp|w+!cVwRbf-WBWlU$8j^v=E,Eov#qT0&+Fa+67t;/c6Jj35}2GZgnR_X');
define('LOGGED_IN_KEY',    '+#FCUlVgenZ)Zu?aT2:gMxDLCn$;SpC+@g%F6sqs,!~b<T7jsA(1E?-P%sd$,&T^');
define('NONCE_KEY',        '+Eh+N@T+R-kao}.C>>se=-E;__g/x5u1A)s1,B}I1^NSZV3/u# J^y1:pPK`XIgK');
define('AUTH_SALT',        '+V,heA2&8>Sf1X/a3|UL%e~-h2Ncpks~Ehl]Yc22!rdyVIlr,,/-?]|=@]f8I<^9');
define('SECURE_AUTH_SALT', '?-@#|auIX3-vz}srVns9)zinthMqsYc<@svm^G17_4Pbu9QM7&^@Hg)Dvy-eg+$d');
define('LOGGED_IN_SALT',   ']|$(%(wj%~)=rUV;@16XYCR13.l62*Zwbh6:8e$~-,IvXQ5zjDJPwf@?$bL6a Ha');
define('NONCE_SALT',       'n.r3:1(W_Jd$zUc,+6xnIbfsDgT%d3am;~2/-E-~-nF;S|%RMbo/R+ yLu~T9%N<');


/* WordPress Database Table prefix. */
$table_prefix = 'wp_';


/* debugging mode */
define( 'WP_DEBUG', false );


/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}


/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
