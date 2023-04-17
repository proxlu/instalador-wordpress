#!/bin/bash
#
# instalador-wordpress.sh - by: proxlu

# Default options
LOCALE="fr_FR"
DB_HOST='localhost'
VIRUSTOTAL_KEY='YOUR_KEY'

printf "Nome do projeto? cf My Project: "
read PROJECT_NAME

printf "Nome genérico do projeto? cf myproject: "
read PROJECT_SLUG

printf "Apelido do projeto? cf mp: "
read PROJECT_PREFIX

printf "Senha do administrador do WordPress: "
read ADMIN_PASSWORD

INSTALL_PATH=$PROJECT_SLUG

# Install WordPress and create the wp-config.php file...
wp core download --path=$INSTALL_PATH --locale=$LOCALE 
wp core config --path=$INSTALL_PATH --dbname=$PROJECT_SLUG --dbuser=$PROJECT_SLUG --dbpass=$PROJECT_SLUG --dbhost=$DB_HOST --dbprefix=$PROJECT_PREFIX"_" 
wp core install --path=$INSTALL_PATH --title='$PROJECT_NAME' --url="http://"$PROJECT_SLUG".l" --admin_user=$PROJECT_SLUG"_admin" --admin_email="admin@"$PROJECT_SLUG".com" --admin_password=$ADMIN_PASSWORD 

# Go in the install directory
cd $INSTALL_PATH

# Update WordPress options
wp option update permalink_structure '/%postname%/'  
wp option update default_ping_status 'closed'  
wp option update default_pingback_flag '0'  

# Install and activate defaults plugins
wp plugin install abt-relative-urls add-custom-post-types-archive-to-nav-menus hide-update-reminder underconstruction better-wp-security backwpup --activate 

# Install defaults plugins
wp plugin install gravity-forms-placeholders disqus-comment-system regenerate-thumbnails widget-classes custom-post-widget jetpack w3-total-cache wordpress-seo 

# Update plugins
wp plugin update --all 

# BackWPup options
wp option update backwpup_cfg_showadminbar '0'  

# iThemes Security options
wp option add itsec_four_oh_four '{"enabled":true,"check_period":5,"error_threshold":20,"white_list":["\/favicon.ico","\/robots.txt","\/apple-touch-icon.png","\/apple-touch-icon-precomposed.png"],"types":[".jpg",".jpeg",".png",".gif",".css"]}'   --format=json 
wp option add itsec_ban_users '{"default":true,"enabled":true,"host_list":[],"agent_list":[""]}'  --format=json 
wp option add itsec_brute_force '{"enabled":true,"max_attempts_host":5,"max_attempts_user":10,"check_period":5,"auto_ban_admin":true}'  --format=json 
wp option add itsec_file_change '{"enabled":true,"split":true,"method":true,"file_list":[""],"types":[".jpg",".jpeg",".png",".log",".mo",".po"],"email":true,"notify_admin":true,"last_chunk":false,"last_run":1415462073}'   --format=json 
wp option add itsec_malware '{"enabled":true,"api_key":"'$VIRUSTOTAL_KEY'"}'  --format=json 
wp option add itsec_tweaks '{"request_methods":true,"suspicious_query_strings":true,"long_url_strings":true,"uploads_php":true,"generator_tag":true,"wlwmanifest_header":true,"edituri_header":true,"file_editor":true,"disable_xmlrpc":0,"disable_unused_author_pages":true,"protect_files":false,"directory_browsing":false,"non_english_characters":false,"write_permissions":false,"theme_updates":false,"plugin_updates":false,"core_updates":false,"comment_spam":false,"random_version":false,"safe_jquery":false,"login_errors":false,"force_unique_nicename":false}'  --format=json 
wp option add itsec_strong_passwords '{"enabled":true,"roll":"contributor"}'  --format=json 
wp option update itsec_data '{"build":4034,"activation_timestamp":1415472546,"already_supported":false,"setup_completed":true,"tooltips_dismissed":true}' --format=json 

# Import photo samples
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-01.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-02.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-03.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-04.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-05.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-06.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-07.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-08.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-09.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-10.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/flowers-11.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-01.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-02.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-03.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-04.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-05.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-06.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-07.jpg
wp media import https://dl.dropboxusercontent.com/u/15052756/photo-samples/building-08.jpg