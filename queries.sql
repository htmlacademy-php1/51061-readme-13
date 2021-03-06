#Напишите запросы для добавления информации в БД:
USE readme;

#придумайте пару комментариев к разным постам;
INSERT INTO comments (content, author_id, post_id)
VALUES ('Комментарий1', 1, 5),
       ('Комментарий2', 1, 5);

#добавить лайк к посту;
INSERT INTO likes (author_id, post_id)
VALUES (1, 5);

#добавить существующий список постов.
INSERT INTO posts (title, content_type_id, author_id, url, image_url, text, quote)
VALUES ('Тест', 1, 2, null, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', null),
       ('Игра престолов', 2, 2, null, NULL, 'Не могу дождаться начала финального сезона своего любимого сериала!',
        null),
       ('Лучшие курсы', 5, 1, 'www.htmlacademy.ru', NULL, null, null),
       ('Наконец, обработал фотки!', 3, 2, null, 'rock-medium.jpg', null, null),
       ('Моя мечта', 3, 2, null, 'coast-medium.jpg', NULL, null),
       ('Супер цитата', 2, 2, null, null, NULL, 'мир и любовь');

#придумайте пару пользователей;
INSERT INTO users (email, login, password, avatar_url)
VALUES ("first@mail.ru", "Виктор", "first123", 'userpic-mark.jpg'),
       ("second@mail.ru", "Лариса", "second123", 'userpic-larisa-small.jpg');

#список типов контента для поста;
INSERT INTO types (title, icon_class)
VALUES ("Текст", "text"),
       ("Цитата", "quote"),
       ("Картинка", "photo"),
       ("Видео", "video"),
       ("Ссылка", "link");

#получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;
SELECT u.id,
       u.login      as 'user_login',
       t.id         as 'type_id',
       t.title      as 'type_title',
       t.icon_class as 'post_icon_class',
       p.title      as 'post_title',
       p.url        as 'url',
       p.image_url  as 'image_url',
       p.text       as 'text',
       p.video_url  as 'video_url',
       p.views      as 'post_views',
       p.id         as 'post_id'
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
       INNER JOIN types t ON p.content_type_id = t.id
ORDER BY p.views DESC;

#получить список постов для конкретного пользователя;
SELECT *
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
WHERE u.id = 1;

#получить список комментариев для одного поста, в комментариях должен быть логин пользователя;
SELECT c.content, u.login, u.id
FROM comments c
       JOIN users u ON c.author_id = u.id
WHERE c.post_id = 5;

#подписаться на пользователя
INSERT INTO subscriptions (author_id, subscription)
VALUES (2, 1);
