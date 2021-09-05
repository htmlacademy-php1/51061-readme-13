<?php

require_once('db.php');
/**
 * @var $con resource|false
 */
require_once('helpers.php');
date_default_timezone_set('Europe/Moscow');

$current_time = date_create()->getTimestamp();
$is_auth = rand(0, 1);
$title = 'readme: популярное';

$sql_queries = [
    'getContentTypes' => "SELECT id,title,icon_class FROM types",
    'getPosts' => "SELECT u.id,
       u.login as 'user_name',
       u.avatar_url as 'avatar',
       t.id    as 'type_id',
       t.title as 'type_title',
       t.icon_class as 'type',
       p.title as 'title',
       p.url as 'url',
       p.image_url as 'image_url',
       p.text as 'text',
       p.video_url as 'video_url',
       p.views as 'post_views',
       p.quote as 'quote',
       p.id    as 'post_id'
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
       INNER JOIN types t ON p.content_type_id = t.id
ORDER BY p.views DESC;"
];

$result_types = mysqli_query($con, $sql_queries['getContentTypes']);
$content_types = mysqli_fetch_all($result_types, MYSQLI_ASSOC);

$result_posts = mysqli_query($con, $sql_queries['getPosts']);
$posts = mysqli_fetch_all($result_posts, MYSQLI_ASSOC);

$content = include_template('main.php', compact("posts", "current_time", "content_types"));
$page = include_template("layout.php", compact("content", "title", "is_auth"));

print($page);
?>

