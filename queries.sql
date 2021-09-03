#Напишите запросы для добавления информации в БД:
USE readme;

#придумайте пару комментариев к разным постам;
INSERT INTO comments (content, author_id, post_id)
VALUES ("Комментарий1", 1, 5),
       ("Комментарий2", 1, 5);

#добавить лайк к посту;
USE readme;
INSERT INTO likes (author_id, post_id)
VALUES (1, 5);

#добавить существующий список постов.
INSERT INTO posts (title, content_type_id, author_id, url, image_url, text)
VALUES ('Тест', 1, 2, null, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
       ('Игра престолов', 2, 2, null, NULL, 'Не могу дождаться начала финального сезона своего любимого сериала!'),
       ('Лучшие курсы', 5, 1, 'www.htmlacademy.ru', NULL, null),
       ('Наконец, обработал фотки!', 3, 2, null, 'rock-medium.jpg', null),
       ('Моя мечта', 3, 2, null, 'coast-medium.jpg', NULL);

#придумайте пару пользователей;
INSERT INTO users (email, login, password, avatar_url)
VALUES ("first@mail.ru", "Виктор", "first123", "userpic-mark.jpg"),
       ("second@mail.ru", "Лариса", "second123", 'userpic-larisa-small.jpg');

#список типов контента для поста;
INSERT INTO types (title, icon_class)
VALUES ("Текст", "text"),
       ("Цитата", "quote"),
       ("Картинка", "photo"),
       ("Видео", "video"),
       ("Ссылка", "link");

#получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;
USE readme;
SELECT u.id,
       u.login,
       t.id    as 'type_id',
       t.content_type_id,
       p.title as "post_title",
       p.views as 'post_views',
       p.id    as 'post_id'
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
       INNER JOIN types t ON p.content_type_id = t.id
ORDER BY pviews DESC;

#получить список постов для конкретного пользователя;
USE readme;
SELECT *
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
WHERE u.id = 1;

#получить список комментариев для одного поста, в комментариях должен быть логин пользователя;
USE readme;
SELECT c.content, u.login, u.id
FROM comments c
       JOIN users u ON c.author_id = u.id
WHERE c.post_id = 5;

#подписаться на пользователя
INSERT INTO subscriptions (author_id, subscription)
VALUES (2, 5);
